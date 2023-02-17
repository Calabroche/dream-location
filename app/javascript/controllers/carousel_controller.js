import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image", "background", "slide"]
  static values = { index: Number }


  connect (){
  console.log("coucou");
  console.log(this.imageTarget);
  console.log(this.modalTarget);
  console.log(this.backgroundTarget);
  console.log(this.slideTargets);
  this.indexValue = 0
  this.handleKeyDown = this.handleKeyDown.bind(this)
  }

  openImage(event) {
    const imageElement = event.currentTarget
    const imageUrl = imageElement.src

    this.imageTarget.src = imageUrl
    this.modalTarget.style.display = "block"
    this.backgroundTarget.classList.add('blur')
  }

  closeImage() {
    this.modalTarget.style.display = "none"
    this.backgroundTarget.classList.remove('blur')
  }

  next() {
    this.indexValue++
    if (this.indexValue >= this.slideTargets.length) {
      this.indexValue = 0
    }
  }

  previous() {
    this.indexValue--
    if (this.indexValue < 0) {
      this.indexValue = this.slideTargets.length - 1
    }
  }

  get currentIndex() {
    return this.indexValue
  }

  set currentIndex(value) {
    this.indexValue = value
  }

  handleKeyDown(event) {
    if (event.keyCode === 37) { // left arrow
      this.previous()
    } else if (event.keyCode === 39) { // right arrow
      this.next()
    }
  }

  connect() {
    document.addEventListener("keydown", this.handleKeyDown)
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleKeyDown)
  }

  update() {
    this.slideTargets.forEach((slide, index) => {
      if (index === this.currentIndex) {
        slide.classList.add("active")
        slide.classList.remove("inactive")
      } else {
        slide.classList.remove("active")
        slide.classList.add("inactive")
      }
    })
  }
}
