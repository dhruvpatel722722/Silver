#!/bin/bash
set -euo pipefail

cd "/app/ticket-management-system-tms01"

cat > /tmp/solution.patch <<'__SOLUTION__'
diff --git a/src/pages/welcomepage.js b/src/pages/welcomepage.js
index a96757a..df81f2c 100644
--- a/src/pages/welcomepage.js
+++ b/src/pages/welcomepage.js
@@ -20,7 +20,7 @@ import {
   FaClock,
   FaPlay,
 } from "react-icons/fa"
-import { motion, AnimatePresence, useScroll, useTransform } from "framer-motion"
+import { motion, AnimatePresence } from "framer-motion"
 
 // Image paths
 const images = {
@@ -105,10 +105,6 @@ const WelcomePage = () => {
   const observerRefs = useRef({})
   const heroRef = useRef(null)
 
-  // Scroll animation
-  const { scrollYProgress } = useScroll()
-  const opacity = useTransform(scrollYProgress, [0, 0.1], [1, 0])
-  const scale = useTransform(scrollYProgress, [0, 0.1], [1, 0.95])
 
   // Typewriter effect states
   const [titleText, setTitleText] = useState("")
@@ -873,6 +869,26 @@ const WelcomePage = () => {
         </div>
       </section>
 
+      {/* Contact Section */}
+      <section id="contact" className="py-20 bg-gradient-to-b from-[#113946] to-[#0a1f2d]">
+        <div className="container mx-auto px-4 text-center">
+          <div className="inline-block px-4 py-1 mb-4 bg-[#EAD7BB]/20 rounded-full text-[#EAD7BB] text-sm font-medium">
+            Contact Us
+          </div>
+          <h2 className="text-3xl md:text-4xl font-bold mb-4 text-white">Get in Touch</h2>
+          <p className="text-lg text-gray-300 max-w-2xl mx-auto mb-8">
+            Have questions or need help getting started? Our team is here to assist you.
+            Reach out and we'll get back to you within 24 hours.
+          </p>
+          <a
+            href="mailto:support@quickassist.io"
+            className="inline-flex items-center px-8 py-3 bg-[#EAD7BB] text-[#113946] font-semibold rounded-md hover:bg-[#FFF2D8] transition-all duration-300 shadow-lg"
+          >
+            Email Us
+          </a>
+        </div>
+      </section>
+
       {/* Footer */}
       <footer className="bg-[#0a1f2d] py-12">
         <div className="container mx-auto px-4">
__SOLUTION__

git apply --verbose /tmp/solution.patch
