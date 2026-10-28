// Preserve corresponding research-section anchors when changing language.
document.addEventListener("DOMContentLoaded", function () {
  const link = document.querySelector(".xu-language-switch");
  if (!link) return;
  const target = link.getAttribute("href");
  function update() { link.setAttribute("href", target + window.location.hash); }
  update();
  window.addEventListener("hashchange", update);
});
