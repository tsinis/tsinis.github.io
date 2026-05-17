// script.js
document.addEventListener("DOMContentLoaded", () => {
  const canvas = document.getElementById("rive-canvas");
  const fallback = document.getElementById("canvas-fallback");
  
  let riveInstance;
  // Initialize Rive instance
  const r = new rive.Rive({
    src: "./assets/avatar.riv",
    canvas: canvas,
    autoplay: true,
    stateMachines: "State Machine", 
    // Force Rive to draw the artboard flush with the bottom of the canvas
    layout: new rive.Layout({
      fit: rive.Fit.Contain,
      alignment: rive.Alignment.BottomCenter
    }),
    onLoad: () => {
      riveInstance = r;
      r.resizeDrawingSurfaceToCanvas();
      
      if (fallback) {
        fallback.style.display = "none";
      }
    },
    onLoadError: (e) => {
      console.error("Error loading Rive file:", e);
      if (fallback) {
        fallback.textContent = "Failed to load interactive avatar.";
      }
    }
  });

  window.addEventListener("pointermove", (e) => {
    if (!riveInstance) return;

    const rect = canvas.getBoundingClientRect();
    if (
      e.clientX < rect.left || 
      e.clientX > rect.right || 
      e.clientY < rect.top || 
      e.clientY > rect.bottom
    ) {
      const clonedEvent = new PointerEvent('pointermove', {
        clientX: e.clientX,
        clientY: e.clientY,
        pointerId: e.pointerId,
        isPrimary: e.isPrimary,
        pointerType: e.pointerType
      });
      canvas.dispatchEvent(clonedEvent);
    }
  });

  window.addEventListener("resize", () => {
    if (riveInstance) {
      riveInstance.resizeDrawingSurfaceToCanvas();
    }
  });
});