import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image"]
  static values = { index: Number }

  connect() {
    console.log(this.imageTarget)
    console.log(this.slideTargets)
    this.index = 0
    this.indexValue = 0
    this.count = this.slideTargets.length
    this.addKeyboardListener()
    window.aaa = this
  }

  openImage(event) {
    const imageElement = event.currentTarget
    const imageUrl = imageElement.src
    this.imageTarget.src = imageUrl
    this.modalTarget.classList.add("opaque-background")
    this.modalTarget.style.display = "block"
    this.index = Array.from(this.slideTargets).indexOf(imageElement)
  }

  closeImage() {
    this.modalTarget.classList.remove("opaque-background")
    this.modalTarget.style.display = "none"
  }
}
