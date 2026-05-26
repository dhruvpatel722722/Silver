<uploaded_files>
/app/ticket-management-system-tms01
</uploaded_files>
I've uploaded a code repository in the directory `/app/ticket-management-system-tms01`. Consider the following task:

The WelcomePage component (`src/pages/welcomepage.js`) has a navigation bar with four section links: Features, Product, Testimonials, and Contact. The first three correctly scroll to their respective sections (`id="features"`, `id="showcase"`, `id="testimonials"`), but the "Contact" link points to `href="#contact"` — and there's no element with `id="contact"` anywhere on the page. Both the desktop and mobile navs expose this broken anchor.

Additionally, the component imports `useScroll` and `useTransform` from framer-motion and computes two transform values (`opacity` and `scale` mapped from scroll progress) that are assigned to variables but never attached to any element's `style` prop. These unused motion values produce unnecessary computation on every scroll event and trigger linter warnings about unused variables.

What needs to happen:

1. Add a contact section to the page (before the footer, after the CTA section) that has `id="contact"`. It should contain at minimum a heading that says "Get in Touch" and a brief contact prompt so the anchor link actually resolves. Keep the styling consistent with the rest of the page (dark background tones, `#EAD7BB` accent color for headings or highlights).

2. Remove the unused `useScroll` and `useTransform` imports and the dead `opacity` / `scale` / `scrollYProgress` variable declarations, since nothing in the component consumes them after a prior refactor removed the scroll-driven style binding.

The existing test suite (`npm test`) should continue to pass after the changes.
