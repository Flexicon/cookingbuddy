import { Controller } from '@hotwired/stimulus';
import TomSelect from 'tom-select';

// Connects to data-controller="select"
export default class extends Controller {
  connect() {
    this.initializeTomSelect();
  }

  disconnect() {
    this.destroyTomSelect();
  }

  initializeTomSelect() {
    if (!this.element) return;

    // Create a new TomSelect instance with the specified configuration.
    // see: https://tom-select.js.org/docs/
    this.select = new TomSelect(this.element, { loadThrottle: 150 });
  }

  // Cleanup: Destroy the TomSelect instance when the controller is disconnected.
  destroyTomSelect() {
    if (this.select) {
      this.select.destroy();
    }
  }
}
