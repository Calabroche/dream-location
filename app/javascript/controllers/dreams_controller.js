import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cars"
export default class extends Controller {
  static targets = ['map']

  onCard(e) {
    const event = new CustomEvent('point', { detail: e.currentTarget.dataset.id });
    this.mapTarget.dispatchEvent(event)
  }
}
