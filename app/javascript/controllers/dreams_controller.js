import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cars"
export default class extends Controller {
  static targets = ['map']

  onCard(event) {
    const customEvent = new CustomEvent('point', { detail: event.currentTarget.dataset.id });
    this.mapTarget.dispatchEvent(customEvent)
  }
}
