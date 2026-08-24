/**
 * Pet Likeness — Studio & Atelier Interaction System
 * Lightweight, accessible, anti-slop vanilla JavaScript
 */
(function () {
  "use strict";

  // TODO: Replace with your actual WhatsApp business digits (country code + number, no symbols)
  const WHATSAPP_NUMBER = "15551234567";

  const WA_MESSAGE = [
    "Hi! I’d like a custom pet figurine handcrafted from my photo.",
    "",
    "Occasion: [birthday cake / wedding cake / gotcha day / keepsake only / other]",
    'Event date (if any): [MM/DD/YYYY or "no date — keepsake"]',
    "Pet: [dog / cat / other] — name (optional): [ ]",
    "I’ll send 1–3 clear photos next.",
    "",
    "Please confirm timing and send a quote after you plan the digital preview. Thanks!",
  ].join("\n");

  const waUrl =
    "https://wa.me/" +
    WHATSAPP_NUMBER +
    "?text=" +
    encodeURIComponent(WA_MESSAGE);

  // Bind WhatsApp URLs to all .js-wa triggers
  document.querySelectorAll(".js-wa").forEach(function (el) {
    el.setAttribute("href", waUrl);
    el.setAttribute("target", "_blank");
    el.setAttribute("rel", "noopener noreferrer");
  });

  // Theme Palette Toggle & LocalStorage persistence
  const root = document.documentElement;
  const paletteSelect = document.querySelector(".js-palette");
  if (paletteSelect) {
    const saved = localStorage.getItem("pl-palette");
    if (saved === "abrigo-sereno" || saved === "cool-paper-warmth") {
      root.setAttribute("data-palette", saved);
      paletteSelect.value = saved;
    }
    paletteSelect.addEventListener("change", function () {
      const next = paletteSelect.value;
      root.setAttribute("data-palette", next);
      localStorage.setItem("pl-palette", next);
    });
  }

  // Smooth single-open toggle for FAQ accordion (progressive enhancement)
  const faqDetails = document.querySelectorAll(".faq details");
  faqDetails.forEach(function (detail) {
    detail.addEventListener("toggle", function () {
      if (detail.open) {
        faqDetails.forEach(function (other) {
          if (other !== detail && other.open) {
            other.removeAttribute("open");
          }
        });
      }
    });
  });
})();

