# Storefront theme refresh — 2026-09-16

This note records the Shopify **Studio Draft** storefront conversion refresh completed on 2026-09-16. The work is design/storefront-only. It does not enable Limitless payment acceptance or public customer charging.

## Safety boundary

- No theme was published by this work.
- The existing MAIN / Launch Candidate themes were not replaced.
- The refreshed themes remain Shopify `UNPUBLISHED` drafts for owner preview.
- Theme work does not authorize or change the Limitless payment gates.
- Cart / storefront actions must not be treated as permission for a real payment.

## FACEJAMAS

Theme: `FaceJamas Studio Draft`

- Premium lifestyle-first DTC conversion refresh based on the approved visual direction.
- Stronger homepage hierarchy, gifting/relationship merchandising, mobile conversion structure, and PDP presentation.
- Visual PDP color selector connected to Shopify variants for Baby Blue, Pink, Lilac, Navy Blue, White, and Black.
- Shopify catalog prices are shown.
- Personalization architecture remains fulfillment-safe: checkout does not need to display the uploaded artwork; Shopify fulfillment receives the opaque `Personalization ID` through the existing Limitless flow.
- Theme remains unpublished.

## COZYINFANTS

Theme: `Cozy Infants Studio Draft`
Theme GID: `gid://shopify/OnlineStoreTheme/155041333422`
Verified update time: `2026-09-16T18:39:53Z`

Refresh includes:

- Premium light/lavender/sky-blue DTC homepage with a darker nighttime editorial close.
- New conversion hero, trust strip, companion grid, how-it-works editorial section, and stronger mobile hierarchy.
- Real companion selection for Peachy, Raffy, Katty, and Bluey using the current Shopify variant IDs.
- Visual PDP companion picker synchronized to the authoritative Shopify variant select, price, product image, and URL variant state.
- Existing theme photography assets reused for the group, individual companions, and box-contents presentation.
- Shopify prices enabled.
- Careful supervised-comfort wording retained; no medical or infant-sleep claim was introduced.
- Customer checkout remains protected by the Limitless launch gate.
- Theme role verified as `UNPUBLISHED` after the update.

## CHEFINGS

Theme: `Chefings Studio Draft`
Theme GID: `gid://shopify/OnlineStoreTheme/153494683717`
Verified update time: `2026-09-16T18:48:35Z`

Refresh includes:

- Premium kitchen/editorial DTC homepage using the existing Chefings visual assets.
- Stronger benefit-led hero, trust strip, problem/solution section, use-case cards, how-it-works section, and conversion close.
- Current Shopify product handle `chefings` connected in theme settings.
- Shopify prices enabled.
- Visual PDP color picker synchronized to the real Green and White Shopify variants.
- PDP emphasizes only verified product facts: handheld format and automatic slicing; unverified accessory/care claims were deliberately not invented.
- Free standard shipping messaging is aligned with the launch policy.
- Customer checkout remains protected by the Limitless launch gate.
- Theme role verified as `UNPUBLISHED` after the update; Shopify reported `processing=false` and `processingFailed=false`.

## Publish workflow

Before publishing, owner should preview each Studio Draft on desktop and mobile and replace/add final lifestyle/product photography wherever desired. Publishing a Shopify theme is separate from enabling public Limitless payments; those payment gates must stay under the controlled launch procedure documented in `docs/HANDOFF.md`.
