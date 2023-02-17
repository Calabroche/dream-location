import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image", "slide", "imageShowDreams"]
  static values = {
    index: Number,
    count: Number
  }


  connect (){
  console.log(this.imageTarget);
  console.log(this.slideTarget);
  this.index = 0
  this.count = this.imageTargets.length
  this.showCurrentImage()
  this.addKeydownEventListener()
  }

  disconnect() {
    this.removeKeydownEventListener()
  }

  openImage(event) {
    const imageElement = event.currentTarget
    const imageUrl = imageElement.src

    this.imageTarget.src = imageUrl
    this.modalTarget.classList.add("opaque-background")
    this.modalTarget.style.display = "block"
  }

  closeImage() {
    this.modalTarget.classList.remove("opaque-background")
    this.modalTarget.style.display = "none"
  }

  hideImage() {
    this.modalTarget.classList.remove("active");
    this.contentTarget.classList.remove("active");
    this.imageTarget.src = "";
  }

  next() {
    if (this.index < this.count - 1) {
      this.index++
      this.showCurrentImage()
    }
  }

  prev() {
    if (this.index > 0) {
      this.index--
      this.showCurrentImage()
    }
  }

  showCurrentImage() {
    this.imageTargets.forEach((image, index) => {
      image.classList.toggle("active", index == this.index)
    })
  }

  addKeydownEventListener() {
    document.addEventListener('keydown', this.handleKeydown)
  }

  removeKeydownEventListener() {
    document.removeEventListener('keydown', this.handleKeydown)
  }

  handleKeydown = event => {
    switch (event.keyCode) {
      case 37: // left arrow key
        this.prev()
        break
      case 39: // right arrow key
        this.next()
        break
    }
  }

}
