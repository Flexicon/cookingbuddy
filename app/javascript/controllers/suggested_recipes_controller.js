import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="suggested-recipes"
export default class extends Controller {
  static values = {
    baseUrl: String
  }

  connect() {
    fetch(
      `${this.baseUrlValue}${this.categoryForTimeOfDay()}`,
      { headers: { 'Accept': 'text/vnd.turbo-stream.html' } },
    )
      .then(response => response.text())
      .then(Turbo.renderStreamMessage);
  }

  categoryForTimeOfDay() {
    const date = new Date();
    const hours = date.getHours();

    if (hours < 12) {
      return 'breakfast';
    } else if (hours < 14) {
      return 'lunch';
    } else if (hours < 18) {
      return 'dinner';
    } else {
      return 'supper';
    }
  }
}
