CREATE OR REPLACE FUNCTION public.limitless_launch_acceptance_commit(p_brand_id text, p_record jsonb)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO pg_catalog, public, limitless
AS $$
DECLARE
  v_attempt jsonb;
  v_attempt_id text := p_record->>'attemptId';
BEGIN
  IF p_record->>'brandId' IS DISTINCT FROM p_brand_id
     OR coalesce(v_attempt_id, '') !~ '^attempt_[0-9a-f-]{36}$' THEN
    RAISE EXCEPTION 'invalid_acceptance_record';
  END IF;

  SELECT p.data::jsonb INTO v_attempt
  FROM limitless.payment_attempts p
  WHERE p.brand_id = p_brand_id AND p.id = v_attempt_id
  FOR UPDATE;

  IF v_attempt IS NULL
     OR v_attempt->>'state' IS DISTINCT FROM 'completed'
     OR v_attempt->'acceptanceMode' IS DISTINCT FROM 'true'::jsonb
     OR coalesce(v_attempt->>'acceptanceNonce', '') = '' THEN
    RAISE EXCEPTION 'invalid_controlled_acceptance_attempt';
  END IF;

  IF v_attempt->>'orderId' IS DISTINCT FROM p_record->>'orderId'
     OR v_attempt->>'totalCents' IS DISTINCT FROM p_record->>'totalCents'
     OR v_attempt->>'shopifyDomain' IS DISTINCT FROM p_record->>'shopifyDomain'
     OR v_attempt->>'whopCompanyId' IS DISTINCT FROM p_record->>'whopCompanyId' THEN
    RAISE EXCEPTION 'acceptance_attempt_mismatch';
  END IF;

  INSERT INTO limitless.metadata(key, value)
  VALUES('launch_acceptance:' || p_brand_id, p_record::text)
  ON CONFLICT(key) DO UPDATE SET value = excluded.value;
END;
$$;

REVOKE ALL ON FUNCTION public.limitless_launch_acceptance_commit(text, jsonb) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.limitless_launch_acceptance_commit(text, jsonb) TO service_role;
