document.addEventListener("DOMContentLoaded", function () {
  /**
   * Displays a chat message in the chat box.
   * @param {string} message - The message text to display.
   * @param {number} duration - How long to wait (in ms) before fading out.
   */
  function showChatMessage(message, duration) {
    const chatBox = document.querySelector(".chat-box");
    if (!chatBox) return;

    // Create a new message element.
    const msgElem = document.createElement("p");
    msgElem.classList.add("chat-message");
    msgElem.textContent = message;

    // Clear any existing messages (optional) and append the new one.
    chatBox.innerHTML = "";
    chatBox.appendChild(msgElem);

    // After "duration" milliseconds, add the fade-out class to trigger animation.
    setTimeout(() => {
      msgElem.classList.add("fade-out");
    }, duration);

    // Once the fade-out animation is complete, remove the element.
    msgElem.addEventListener("animationend", (e) => {
      if (e.animationName === "chatFadeOut") {
        msgElem.remove();
      }
    });
  }

  // Expose the function to global scope so that it can be triggered externally.
  window.showChatMessage = showChatMessage;
});
