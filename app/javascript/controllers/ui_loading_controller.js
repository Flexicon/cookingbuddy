import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="ui-loading"
export default class extends Controller {
  static targets = ["button", "text", "indicator", "hideable"];

  showLoading(_event) {
    this.#disableButton();
    this.#showIndicators();
    this.#hideHideables();
  }

  #disableButton() {
    if (this.hasButtonTarget) {
      requestAnimationFrame(() => {
        this.buttonTarget.disabled = true;
      });
    }
  }

  #showIndicators() {
    if (!this.hasIndicatorTarget) return;

    this.indicatorTargets.forEach((indicator) => {
      indicator.classList.remove("hidden");
      indicator.setAttribute("aria-hidden", "false");
    });
  }

  #hideHideables() {
    if (!this.hasHideableTarget) return;

    this.hideableTargets.forEach((hideable) => {
      hideable.classList.add("hidden");
      hideable.setAttribute("aria-hidden", "true");
    });
  }
}
