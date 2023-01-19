import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tomselect"
export default class extends Controller {
  connect() {
    new TomSelect("#select-beast",{
      create: true,
      sortField: {
        field: "text",
        direction: "asc"
      }
    });
  }
}
