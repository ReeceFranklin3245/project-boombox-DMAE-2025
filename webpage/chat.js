document.addEventListener("DOMContentLoaded", function () {
  /**
   * Displays a chat message in the chat box.
   * @param {string} message - The message text to display.
   * @param {number} duration - How long (in ms) the message remains before fading out.
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

    // After "duration" milliseconds, trigger the fade-out animation.
    setTimeout(() => {
      msgElem.classList.add("fade-out");
    }, duration);

    // Remove the element after the fade-out animation completes.
    msgElem.addEventListener("animationend", (e) => {
      if (e.animationName === "chatFadeOut") {
        msgElem.remove();
      }
    });
  }

  // Expose the function globally so it can be triggered externally.
  window.showChatMessage = showChatMessage;
});
