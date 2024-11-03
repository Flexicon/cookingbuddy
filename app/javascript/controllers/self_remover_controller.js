import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="self-remover"
export default class extends Controller {
  yeet() {
    this.element.remove();
  }
}
