import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image"]
  connect (){
  console.log("coucou");
  console.log(this.imageTarget);
  }

  openImage(event) {
    const imageElement = event.currentTarget
    const imageUrl = imageElement.src

    this.imageTarget.src = imageUrl
    this.modalTarget.style.display = "block"
  }

  closeImage() {
    this.modalTarget.style.display = "none"
  }
}
