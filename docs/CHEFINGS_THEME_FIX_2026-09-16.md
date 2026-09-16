# Chefings storefront fix — 2026-09-16

## Issue found after Conversion V2 publication

The published `Chefings Studio Draft` theme exposed two PDP issues:

1. The White product color could not be selected reliably even though the Shopify White variant itself is active, in stock and sellable online.
2. The quantity bundle offer cards were missing from the product page.

## Corrected theme

A new unpublished theme named **`Chefings Conversion Fix`** was duplicated directly from the current MAIN theme so it preserves the exact published Conversion V2 design.

Shopify theme ID: `gid://shopify/OnlineStoreTheme/153629655109`.

The corrected theme processed successfully with `processing=false` and `processingFailed=false` after the changes.

## Color selector fix

The Chefings color selector now uses native product-form radio inputs with `name="id"` instead of relying on JavaScript to copy a button selection into a hidden select. Green and White are therefore directly bound to their real Shopify variants, with JavaScript used only for progressive enhancement such as selected price/media/URL updates.

Current Shopify variants verified before the fix:

- Green — available, in stock, $29.00.
- White — available, in stock, $29.00.

## Bundle selector restored

The product page now renders native radio-card quantity choices using `name="quantity"`:

- Buy 1 — regular price.
- Buy 2 — 10% off (`Popular`).
- Buy 3 — 15% off.
- Buy 4 — 20% off (`Best value`).

The cards display total, per-item price and savings. Shopify's existing automatic quantity discounts remain authoritative; the theme only selects quantity and previews the already-approved tier economics.

Previously verified Chefings Shopify totals remain:

- Buy 2: $58.00 → $52.20.
- Buy 3: $87.00 → $73.95.
- Buy 4: $116.00 → $92.80.

## Publication

Shopify blocks automated publication of a MAIN theme through the connected interface. The owner should publish **`Chefings Conversion Fix`** in Shopify Admin after previewing it. It replaces the currently published `Chefings Studio Draft`.

## Payment safety

This storefront/theme fix does not change Limitless payment configuration. Controlled acceptance and public customer payment gates remain separate launch steps and must stay OFF until the required owner authorization/testing sequence.