# Limitless Checkout — current handoff

Last updated: 2026-09-16.

## Current launch state

- Production branch: `hoplite/beroia-65b17429`.
- Bundle/release work branch: `feature/bundles-launch`.
- CHEFINGS, COZYINFANTS and FACEJAMAS are now **`status=live`, `mode=live`** in the Limitless brand store.
- Supabase production gates remain **`payment_acceptance_enabled=false`** and **`public_payment_enabled=false`**.
- Therefore brand publication/readiness is separated from customer charging: the brands are live in Limitless, but no public or controlled payment can start yet.
- Do not arm controlled acceptance until the owner explicitly authorizes the real acceptance purchase immediately before it happens.
- Do not enable public payments until controlled acceptance succeeds and the owner separately authorizes public charging.

## Shopify storefront themes — BUILT, PUBLISH CLICK PENDING

The three correct Shopify launch-candidate themes have been updated directly in their stores. Shopify connector safety permits writes to unpublished themes but does not permit changing the MAIN/published theme, so the final Publish action must be clicked by the owner in Shopify Admin.

### CHEFINGS

- Current MAIN: `Chefings Studio Draft`.
- Publish this theme: **`Chefings Launch Candidate`**.
- Launch Candidate theme ID: `gid://shopify/OnlineStoreTheme/153546522693`.
- Product page now has Buy 1 / Buy 2 / Buy 3 / Buy 4 cards with 0% / 10% / 15% / 20% savings, per-item pricing and Best value treatment.
- Green/White Shopify variants remain authoritative.
- Cart displays automatic bundle savings and keeps free standard shipping.
- Secure checkout handoff remains `https://checkout.chefings.com/cart/start/chefings`.
- Theme write completed without Shopify user errors on 2026-09-16.

### COZYINFANTS

- Current MAIN: `Cozy Infants Studio Draft`.
- Publish this theme: **`Cozy Infants Launch Candidate`**.
- Launch Candidate theme ID: `gid://shopify/OnlineStoreTheme/155082260654`.
- Product page now has Buy 1 / Buy 2 / Buy 3 / Buy 4 cards with 0% / 10% / 15% / 20% savings, per-item pricing and Best value treatment.
- Existing companion selection/image behavior is preserved.
- Cart displays automatic bundle savings.
- Legacy Shopify priority-processing product remains excluded from storefront checkout handoff; optional $4.99 priority is still once/order inside Limitless checkout.
- Secure checkout handoff remains `https://checkout.cozyinfants.com/cart/start/cozyinfants`.
- Theme write completed without Shopify user errors on 2026-09-16.

### FACEJAMAS

- Current MAIN: `FaceJamas Studio Draft`.
- Publish this theme: **`FaceJamas Launch Candidate`**.
- Launch Candidate theme ID: `gid://shopify/OnlineStoreTheme/162448605397`.
- Product page now has Solo / Duo / Trio / Family cards with 0% / 10% / 15% / 20% savings.
- Pack selection creates one private personalization slot per item.
- Every personalized item is added to Shopify as a separate quantity-1 line with its own private Personalization Ref/proof, allowing different faces within Duo/Trio/Family while still qualifying for Shopify quantity discounts.
- Cart locks personalized lines to quantity 1 and validates unique personalization receipts before Limitless handoff.
- Source artwork remains private; Shopify/Limitless use opaque personalization references rather than image URLs.
- Secure checkout handoff remains `https://checkout.facejamas.com/cart/start/facejamas`.
- Theme write completed without Shopify user errors on 2026-09-16.

## Bundle feature — COMPLETE AND NO-CHARGE TESTED

Canonical bundle tiers:

| Tier | Quantity | Automatic product discount |
| --- | ---: | ---: |
| Solo / Buy 1 | 1 | 0% |
| Duo / Buy 2 | 2 | 10% |
| Trio / Buy 3 | 3 | 15% |
| Family / Buy 4+ | 4+ | 20% |

Shopify automatic discounts exist on all three stores. Overlapping rules were verified to choose only the best eligible tier rather than stack.

Representative authoritative QA:

- CHEFINGS: 2 × $29 = $58 → **$52.20**, shipping $0, payment disabled.
- COZYINFANTS: 4 × $49 = $196 → **$156.80**; with $4.99 priority = **$161.79**, shipping $0, payment disabled.
- FACEJAMAS: three separate $69 Pajamas lines with three unique Personalization IDs = $207 → **$175.95**, shipping $0, payment disabled.

`limitless-checkout-runtime` is active as bundle-aware runtime `v3-bundles` / Edge Function v3. Shopify remains authoritative for product state, automatic discount, tax, free shipping and exact USD total. Limitless validates the exact expected automatic PRODUCT/line-level tier title and discount amount before payment creation.

## Provider / policy state

All six provider connections are recovered and verified:

| Brand | Shopify | Whop | Support |
| --- | --- | --- | --- |
| CHEFINGS | `5ctqsk-tn.myshopify.com` | `biz_oSecL7MrGnjRmk` | `support@chefings.com` |
| COZYINFANTS | `1b1zsq-0y.myshopify.com` | `biz_ZfAubYoFlaajTC` | `support@cozyinfants.com` |
| FACEJAMAS | `f0m103-zz.myshopify.com` | `biz_MW3bKLHdo3ItcR` | `support@facejamas.com` |

Customer launch policy v2 is approved for all three brands. Policy approval is not authorization for a real charge.

## FaceJamas fulfillment architecture

- Source images remain private in Supabase.
- Shopify order lines contain opaque `Personalization ID` metadata only.
- Artwork does not need to render in checkout.
- Fulfillment may export Shopify order data and resolve Personalization IDs through private tooling/API, or use an authenticated fulfillment endpoint returning short-lived signed artwork URLs.
- Ordered source artwork retention is 90 days after order association, followed by private source-file deletion; non-image order/audit metadata may remain.

## Payment architecture / safety invariants

1. Shopify calculates authoritative availability, discounts, free shipping, tax and exact USD total.
2. Limitless creates one idempotent transaction-locked attempt.
3. Shopify creates one reserved draft tagged with the Limitless attempt ID.
4. Whop creates one one-time checkout configuration for the exact cents.
5. Raw card/CVV data never enters Limitless.
6. Signed Whop webhook + independent Whop retrieval must match brand, amount, currency, checkout ID and attempt metadata.
7. Exactly one Shopify draft completes into a paid order under idempotency/lease protection.
8. Duplicate/retried notifications cannot create a second order.
9. Customer confirmation comes from persisted attempt state, not merely browser redirect.

## Netlify / checkout hosting

Netlify hosts the branded Limitless checkout application, not the Shopify storefront themes. The Netlify team was paused after the Personal plan's monthly credit pool was exhausted primarily by repeated production deploys.

The owner intends to restore/pay for Netlify on 2026-09-16. Until hosting is restored:

- keep development off the production deploy branch;
- batch release changes;
- do not enable either payment gate.

After Netlify is restored, verify the current production checkout build, merge/batch the bundle release into production once, and run browser smoke QA before any real payment.

## Exact next steps

1. In each Shopify Admin, publish the exact Launch Candidate theme listed above. This is the only remaining Shopify storefront action and requires the owner click because the connector cannot change the MAIN theme.
2. Restore/pay for Netlify.
3. Verify checkout.chefings.com, checkout.cozyinfants.com and checkout.facejamas.com are serving the intended production checkout build.
4. Batch the Git release to production and perform no-charge browser smoke QA with both gates still OFF.
5. Immediately before a real charge, obtain explicit owner authorization for controlled acceptance.
6. Set **only** `payment_acceptance_enabled=true`, leaving `public_payment_enabled=false`.
7. Run controlled real acceptance purchase(s) and verify Whop → signed webhook → independent retrieval → exactly one paid Shopify order. For FaceJamas also verify each expected Personalization ID resolves privately to the correct artwork.
8. Record acceptance.
9. Obtain a separate explicit owner authorization before setting `public_payment_enabled=true`.

## Definition of done

A customer can select a product/bundle on the published Shopify storefront, pass only trusted variant/quantity/personalization references into the matching branded Limitless checkout, review Shopify's authoritative discounted USD total with free shipping and optional $4.99 priority processing, pay that exact amount in embedded Whop fields, and receive confirmation only after exactly one corresponding Shopify order exists. FaceJamas orders contain opaque Personalization IDs that private fulfillment tooling can resolve to the correct artwork. Retries never duplicate an order or ask a paid customer to pay again.
