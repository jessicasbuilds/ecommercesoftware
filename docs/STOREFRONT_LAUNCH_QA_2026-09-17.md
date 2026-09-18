# Storefront launch QA — 2026-09-17

This audit checks the actual public storefront HTML, live cart rendering, bundle behavior, Limitless handoff, visible wording, policy/support links, image coverage and color-system basics for CHEFINGS, COZYINFANTS and FACEJAMAS.

Customer charging remained OFF throughout this audit.

## Payment safety

- `payment_acceptance_enabled=false`
- `public_payment_enabled=false`
- payment attempts remained 0
- no real payment, order or acceptance purchase was created

## COZYINFANTS

Live theme:
- `Cozy Infants Launch Ready`
- theme ID `155172700334`

Verified public PDP:
- Peachy / Raffy / Katty / Bluey visible
- Buy 1 / Buy 2 / Buy 3 / Buy 4 visible
- 10% / 15% / 20% bundle tiers visible
- no visible native Buy Now / Shopify checkout button on PDP
- high-resolution companion and box-contents imagery is present
- no visible owner/admin/test/demo/Whop/Shopify wording in normal customer page copy

Rendered anonymous cart QA:
- 2 × $49 = $98 regular
- automatic 10% discount = -$9.80
- subtotal = $88.20
- bundle savings shown visibly
- quantity input present
- AJAX Remove control present
- checkout button ID used by live theme JavaScript is present
- live `shopify.js` posts to `https://checkout.cozyinfants.com/cart/start/cozyinfants`

Footer/status:
- shipping/refund/privacy/terms/contact/track links all resolve HTTP 200
- HOWEVER policy/support content needs correction:
  - Shipping policy contains literal placeholder `[Home Country]`
  - Terms still refers to old product name `Patty Paws` and old baby/sleep wording
  - Refund wording is stale/overly formal and uses old lowercase branding
  - Contact page has no contact form, mailto link or useful support body
  - Track Order page has no tracking UI or useful body
- homepage title currently renders `Cozy Infants — Cozy Infants`

Palette:
- background `#10132e`
- foreground `#faf7ff`
- accent `#ded0ff`
- button ink `#24213e`
- strong contrast; no palette blocker identified

## CHEFINGS

Live theme:
- `Chefings Conversion Fix`
- theme ID `153629655109`
- therefore the color/bundle correction is already published

Verified public PDP:
- Green and White variants visible
- Buy 1 / Buy 2 / Buy 3 / Buy 4 visible
- exact bundle pricing visible:
  - 1 = $29.00
  - 2 = $52.20 ($26.10 each), saves $5.80
  - 3 = $73.95 ($24.65 each), saves $13.05
  - 4 = $92.80 ($23.20 each), saves $23.20
- no visible native Buy Now markup on PDP
- no visible owner/admin/test/demo/Whop/Shopify wording in normal customer page copy

Rendered anonymous cart QA:
- 2-unit cart received Shopify automatic discount `Limitless Duo — 10% off 2+`
- $58 regular -> $52.20 final
- visible Checkout button submits dedicated hidden form
- form action is `https://checkout.chefings.com/cart/start/chefings`
- therefore normal Chefings cart checkout does not use native Shopify checkout

Footer/status:
- Privacy exists
- Contact URL exists but page is empty
- Shipping policy: 404
- Refund policy: 404
- Terms of service: 404
- visible footer Shipping / Returns / Terms / Contact links currently point to `/`
- homepage title currently renders `CHEFINGS — CHEFINGS`

Imagery:
- live storefront uses high-resolution `hero.png`
- Shopify variant itself currently reports no featured image
- live theme assets found: `hero.png`, `logo-2.png`, favicon
- do not attach a generic variant image until correct Green/White product imagery is available

Palette:
- background `#fffdf7`
- foreground `#26291e`
- accent `#d53422`
- button text white
- accent/white contrast is acceptable for normal text

## FACEJAMAS

Live theme:
- `FaceJamas Launch Candidate`
- theme ID `162448605397`

Verified all three live PDPs:
- pajamas $69
- hooded blanket $59
- pillow $39
- Baby Blue / Pink / Lilac / Navy Blue / White / Black visible on each
- Solo / Duo / Trio / Family Pack visible
- 10% / 15% / 20% tiers visible
- explicit wording that every item gets its own photo
- JPG/PNG/WebP, max 10MB wording visible
- no visible native Buy Now markup on PDPs
- no visible owner/admin/test/demo/Whop/Shopify wording in normal customer page copy
- live `shopify.js` validates unique personalization ref/proof per line and posts carts to `https://checkout.facejamas.com/cart/start/facejamas`

Footer/status:
- Privacy exists
- Contact URL exists but page is empty
- Shipping policy: 404
- Refund policy: 404
- Terms of service: 404
- visible footer Shipping / Returns / Terms / Contact links currently point to `/`
- homepage title currently renders `FACEJAMAS — FACEJAMAS`

Imagery:
- all three live PDPs currently use the same fallback `hero.png`
- variant `data-media` values are empty; gallery thumbnails are empty
- there are no distinct rendered pajama/hoodie/pillow product media galleries
- this is an aesthetic/conversion gap and should be fixed before paid traffic

Palette:
- background `#fff8fc`
- foreground `#381536`
- accent `#ed3979`
- button text currently white
- white on `#ed3979` is ~3.84:1 contrast, below 4.5:1 for normal text
- keep the palette but use darker CTA text or deepen the accent

## Limitless checkout polish performed during this audit

LIVE:
- Supabase checkout runtime upgraded to version 4
- bundle runtime logic preserved
- customer-facing provider/internal error strings sanitized
- generic checkout metadata replaced with brand-specific/direct wording
- customer charging gates remain OFF

SOURCE COMMITTED BUT NOT YET NETLIFY-DEPLOYED:
- payment-return UI removes Shopify/provider/internal wording
- checkout intro/address/security/trust wording tightened
- checkout summary shows explicit `Bundle savings` line

Current Netlify production deploy has not automatically moved to those latest UI commits. Do not claim those React UI copy changes are live until Netlify is redeployed.

## Required fixes before public launch

1. Reconnect Shopify write access.
2. Publish approved Shipping / Return / Terms policies for Chefings and FaceJamas.
3. Replace stale Cozy shipping/refund/terms policy content with policy-v2-aligned wording.
4. Fix footer links on Chefings and FaceJamas to real policy/contact destinations.
5. Add useful Contact content/forms (or at minimum visible monitored support email) on all three.
6. Make Cozy Track Order page functional or remove the link until it is.
7. Add distinct FaceJamas product imagery/media for pajamas, hooded blanket and pillow.
8. Add correct Chefings Green/White product media to Shopify catalog when available.
9. Change FaceJamas CTA foreground/darken accent to improve normal-text contrast.
10. Clean redundant homepage titles.
11. Redeploy latest Limitless Netlify checkout UI commits.
12. Re-run rendered desktop/mobile visual QA after those fixes.
13. Only then proceed to controlled real payment acceptance, with separate explicit owner authorization.
