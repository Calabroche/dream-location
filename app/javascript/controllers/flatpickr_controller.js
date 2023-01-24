import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startsAt", "endsAt" ]
  connect() {
    flatpickr(this.startsAtTarget, {
      minDate: "today",
      plugins: [new rangePlugin({ input: "#end_time"})]
    });
    flatpickr(this.endsAtTarget, {})
  }
}
