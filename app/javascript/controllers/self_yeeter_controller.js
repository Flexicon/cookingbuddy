import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="self-yeeter"
export default class extends Controller {
  yeet() {
    this.element.remove();
  }
}
