## Root Cause

After commit a9c8e60 removed the `style={{ opacity, scale }}` binding from the hero section's `<motion.div>`, the `useScroll()` and `useTransform()` calls that produced those values became dead code. Nobody cleaned them up. Separately, all four nav anchors (#features, #showcase, #testimonials, #contact) were added during the page redesign, but only three matching section `id` attributes were ever created. The contact section was never added.

## Fix

1. In `src/pages/welcomepage.js`:
   - Remove `useScroll` and `useTransform` from the framer-motion import line.
   - Delete the three lines that compute `scrollYProgress`, `opacity`, and `scale`.
   - Add a `<section id="contact">` block between the CTA section and the footer. Contents: a heading ("Get in Touch"), a short paragraph, and the section uses the existing color palette.

## What the tests cover

- `fail_to_pass`: Tests verify that (a) an element with `id="contact"` exists on the page when WelcomePage renders, and (b) the source file does not contain the dead `useTransform`/`useScroll` variable declarations.
- `pass_to_pass`: Tests verify that the other three sections (features, showcase, testimonials) still render, that all six feature cards appear, that testimonial content is present, and that navigation links exist.
