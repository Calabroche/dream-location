import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image", "slide"]
  static values = {
    index: Number,
    count: Number
  }

  connect() {
    console.log(this.imageTarget)
    console.log(this.slideTargets)
    this.index = 0
    this.count = this.slideTargets.length
    this.addKeyboardListener()
  }

  addKeyboardListener() {
    document.addEventListener("keydown", (event) => {
      if (this.modalTarget.style.display === "block") {
        if (event.key === "ArrowLeft") {
          console.log("left");
          this.prevImage()
        } else if (event.key === "ArrowRight") {
          this.nextImage()
        }
      }
    })
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

  prevImage() {
    this.index = (this.index - 1 + this.count) % this.count
    console.log(this.index);
    this.imageTarget.src = this.slideTargets[this.index].src
    console.log(this.imageTarget.src);
  }

  nextImage() {
    this.index = (this.index + 1) % this.count
    this.imageTarget.src = this.slideTargets[this.index].src
  }
}
