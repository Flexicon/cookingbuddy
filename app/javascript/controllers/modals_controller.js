import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="modals"
export default class extends Controller {
  connect() {
    if (typeof this.element.showModal === "function") {
      this.element.showModal();

      // Clean up the modal when it is closed
      this.element.addEventListener("close", (_e) => {
        this.element.remove();
      });
    }
  }

  close(e) {
    if (typeof this.element.close === "function") {
      e.preventDefault();
      this.element.close();
    }
  }
}
