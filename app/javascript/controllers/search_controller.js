import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["results", "input"]

  updateDreams() {
    const url = new URL(window.location.href);
    url.searchParams.set(this.inputTarget.name, this.inputTarget.value);
    fetch(url, { headers: { accept: "text/plain" } })
      .then((response) => response.text())
      .then((partial) => {
        this.resultsTarget.innerHTML = partial;
      });
  }
}
