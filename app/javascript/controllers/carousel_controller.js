import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image", "currentImage", "slide", "imageTwo", "imageThree"]
  static values = { index: Number }

  connect() {
    console.log(this.imageTarget)
    window.aaa = this
  }

  openImage(event) {
    const imageElement = event.currentTarget
    const imageUrl = imageElement.src
    this.imageTarget.src = imageUrl
    this.modalTarget.classList.add("opaque-background")
    this.modalTarget.style.display = "block"
    this.index = Array.from(this.currentImageTargets).indexOf(imageElement)
    this.setCurrentImageTarget(imageElement)
    document.addEventListener("keydown", this.handleKeyDown.bind(this))
  }

  closeImage() {
    this.modalTarget.classList.remove("opaque-background")
    this.modalTarget.style.display = "none"
    document.removeEventListener("keydown", this.handleKeyDown.bind(this))
  }

  handleKeyDown(event) {
    if (event.key === "ArrowLeft") {
      this.index = (this.index - 1 + this.slideTargets.length) % this.slideTargets.length;
    } else if (event.key === "ArrowRight") {
      this.index = (this.index + 1) % this.slideTargets.length;
    }
    const imageElement = this.slideTargets[this.index].querySelector("img");
    const imageUrl = imageElement.src;
    this.imageTarget.src = imageUrl;
    this.setCurrentImageTarget(imageElement);
  }



  setCurrentImageTarget(target) {
    this.currentImageTargets.forEach((currentImageTarget) => {
      currentImageTarget.classList.remove("current-image")
    })
    target.classList.add("current-image")
  }
}
