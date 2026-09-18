# Shopify storefront production patch — 2026-09-17

This is the exact storefront patch to apply after Shopify write authorization is restored. It implements storefront QA items 1–9 and supplies the validation criteria for item 11. Payment settings are out of scope and must remain unchanged.

## Required Shopify access for the apply step

- read_themes, write_themes
- read_content, write_content
- read_online_store_pages, write_online_store_pages
- read_legal_policies, write_legal_policies
- read_files, write_files
- read_products, write_products

Existing Limitless credentials currently have only read_products, read_inventory, read_draft_orders and write_draft_orders, so this patch must not be applied through those credentials until the store owner authorizes the broader access.

## Shared Contact & support page

Need help with an order or product? Email **{SUPPORT_EMAIL}**.

Please include your order number when contacting us about an existing order. We aim to respond within 1–2 business days.

For order changes or cancellation requests, contact us as soon as possible. Changes cannot be guaranteed after fulfillment or production has started.

## Shared Shipping & delivery policy

All orders are shown and charged in USD.

Standard shipping is free on every order. We currently support delivery to the United States, Canada, the United Kingdom, New Zealand and Australia.

If you choose Priority Processing at checkout, the $4.99 fee moves your order into our priority-processing workflow. It is not an upgraded courier service and does not guarantee a delivery date.

Delivery estimates are estimates, not guarantees. Timing can vary because of destination, fulfillment time, carrier conditions, customs or other circumstances outside our control.

Tracking information is sent when it becomes available. Please make sure your delivery address is correct before placing your order. If you notice an address error, contact support as soon as possible; changes cannot be guaranteed after fulfillment has started.

Any duties, taxes or customs charges not collected at checkout may be the recipient’s responsibility where required by local law.

# CHEFINGS

## Refund / return policy

Eligible non-personalized Chefings items may be requested for return within 30 days of delivery. Items must be unused and in their original condition.

Before sending a return, email **support@chefings.com** with your order number and the reason for the request. Do not send a return before receiving return instructions.

If an item arrives damaged, defective or incorrect, contact us and we will review the issue for a replacement, correction or refund as appropriate.

Approved refunds are issued to the original payment method after the return or reported issue has been reviewed. Optional Priority Processing fees are not refundable after priority processing has begun.

Cancellation requests are accepted before fulfillment begins, but cancellation cannot be guaranteed once processing or fulfillment has started.

## Terms of service — customer-facing essentials

By placing an order with Chefings, you agree to the prices, product information and policies shown at the time of purchase.

Prices are shown in USD. Product availability and applicable taxes are confirmed at checkout.

Chefings is a handheld automatic kitchen cutter for everyday food preparation. Use the product only as directed in the instructions supplied with your order. Product-care, cleaning, material, blade, battery and safety information on the website must match the final manufactured product and included instructions.

We may cancel and refund an order if an item becomes unavailable, a pricing error is identified, or we cannot safely fulfill the order.

Nothing in these terms limits rights available to you under applicable consumer law.

Questions about an order can be sent to **support@chefings.com**.

## Footer
- Shipping → /policies/shipping-policy
- Returns → /policies/refund-policy
- Privacy → /policies/privacy-policy
- Terms → /policies/terms-of-service
- Contact → /pages/contact

## Homepage metadata
Title: **Chefings | Automatic Kitchen Cutter**

## Product media mapping
Recovered approved/reference-derived media:
- Green clean hero: Library asset image-gen-2(1).png
- Green use image: Library asset image-gen-4(1).png
- White clean hero: Library asset image-gen-1(4).png
- White use image: Library asset image-gen-3(1).png

Attach the Green clean hero to the Green Shopify variant and the White clean hero to the White Shopify variant. Add the use images to the product gallery. Do not use text-heavy composite graphics as primary Shopify product media.

# COZY INFANTS

## Shipping policy
Replace the existing shipping page entirely with the shared Shipping & delivery copy above. Remove the literal [Home Country] placeholder.

## Refund / return policy

Eligible non-personalized Cuddle Bears may be requested for return within 30 days of delivery. Returned items must be unused and in their original condition.

Before sending a return, email **support@cozyinfants.com** with your order number and the reason for the request. Do not send a return before receiving instructions.

If an item arrives damaged, defective or incorrect, contact us and we will review the issue for a replacement, correction or refund as appropriate.

Approved refunds are issued to the original payment method after the return or reported issue has been reviewed. Optional Priority Processing fees are not refundable after priority processing has begun.

Cancellation requests are accepted before fulfillment begins, but cancellation cannot be guaranteed once processing or fulfillment has started.

## Terms of service — customer-facing essentials

By placing an order with Cozy Infants, you agree to the prices, product information and policies shown at the time of purchase.

Prices are shown in USD. Product availability and applicable taxes are confirmed at checkout.

Cuddle Bears are comfort products intended for supervised use. They are not medical treatments, anxiety treatments or infant sleep products. Use, age guidance, care instructions, battery information, warnings and safety instructions must follow the information included with the final shipped product and packaging.

We may cancel and refund an order if an item becomes unavailable, a pricing error is identified, or we cannot safely fulfill the order.

Nothing in these terms limits rights available to you under applicable consumer law.

Questions about an order can be sent to **support@cozyinfants.com**.

Remove every reference to “Patty Paws”, medical/sleep claims, “your baby”, and paediatrician language from the current terms.

## Contact page
Use the shared Contact & support copy with **support@cozyinfants.com**.

## Track Your Order
Until a real tracking lookup integration is available, **remove the Track your order link from the footer**. Do not leave a blank page linked from customer navigation.

If retaining the page for future use, keep it unpublished/unlinked. Do not present an empty tracker as functional.

## Homepage metadata
Title: **Cozy Infants | Cuddle Bears**

# FACEJAMAS

## Refund / return policy

FaceJamas products are made using customer-supplied personalization and are final sale except when an item arrives damaged, defective, incorrect or with a verified production error.

If there is a qualifying problem with your order, email **support@facejamas.com** with your order number and details of the issue. We may replace, correct or refund the affected item as appropriate after review.

Optional Priority Processing fees are not refundable after priority processing has begun.

Cancellation requests are accepted before production begins, but cancellation cannot be guaranteed after production has started.

Small differences in print placement or color can occur during production. Customers are responsible for having permission to use any image they upload and must not upload content that infringes another person’s rights.

## Terms of service — customer-facing essentials

By placing a FaceJamas order, you confirm that you have permission to use the image you upload and that the image does not infringe another person’s rights.

Prices are shown in USD. Product availability and applicable taxes are confirmed at checkout.

Personalized products are made from the image and product/color selections submitted with the order. Normal manufacturing variation in print placement or color may occur.

We may decline personalization that cannot lawfully or safely be produced. If we cannot fulfill an accepted order, the affected amount will be refunded as appropriate.

The personalized-order return, cancellation and production-error rules are described in our Returns & exchanges policy.

Nothing in these terms limits rights available to you under applicable consumer law.

Questions about an order can be sent to **support@facejamas.com**.

## Contact page
Use the shared Contact & support copy with **support@facejamas.com**.

## Footer
- Shipping & delivery → /policies/shipping-policy
- Returns & exchanges → /policies/refund-policy
- Privacy → /policies/privacy-policy
- Terms of service → /policies/terms-of-service
- Contact & support → /pages/contact

## Homepage metadata
Title: **FaceJamas | Personalized Pajamas, Hooded Blankets & Pillows**

## CTA contrast
Keep the existing pink accent #ed3979 but change normal-size CTA/button foreground from white to dark plum #381536.

## Product media mapping
Product construction references recovered from the Library:
- Pajamas reference: IMG_5724.jpeg / IMG_5725.jpeg
- Blanket hoodie reference: IMG_5727.jpeg
- Custom-shape plush pillow reference: IMG_5726.jpeg

Do not publish supplier screenshots as final customer-facing product photography. Use them only as construction references for clean ecommerce assets.

Each product requires its own primary gallery instead of the shared hero.png fallback:
- Pajamas: clean product hero + alternate + lifestyle
- Blanket hoodie: clean product hero + alternate + lifestyle
- Pillow: clean face-shaped pillow hero + side/thickness + lifestyle

Each Shopify color variant should map to its corresponding product/color media when those generated color masters are available. Keep Baby Blue as the default.

Remove the empty gallery state and empty variant data-media mappings once real media is attached.

# Final verification after apply

Desktop and mobile, for all three stores:
- no owner/admin/test/demo/internal wording
- no broken policy/support links
- no duplicate homepage titles
- no empty Contact/Track pages linked from navigation
- no native Buy Now path bypassing Limitless
- bundle selector works and savings match 10% / 15% / 20%
- cart savings match PDP claims
- cart remove and quantity controls work
- checkout handoff remains on the brand checkout subdomain
- FaceJamas requires one verified photo per personalized item
- product galleries display the correct product, color and alt text
- CTA text meets normal-text contrast
- footer wraps cleanly at narrow mobile widths
- no horizontal overflow at 320–430px widths

Payment acceptance remains OFF during all storefront QA.
