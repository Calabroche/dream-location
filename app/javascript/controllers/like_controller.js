// app/javascript/controllers/like_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["heart", "button"];

  connect() {
    this.updateHeartColor();
  }

  toggle() {
    const likeId = this.buttonTarget.dataset.likeId;
    const url = this.buttonTarget.href;
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    this.buttonTarget.disabled = true;

    fetch(url, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ id: likeId })
    }).then(response => {
      if (response.ok) {
        this.toggleHeartColor();
      }
      this.buttonTarget.disabled = false;
    });
  }

  updateHeartColor() {
    if (this.hasHeartTarget) {
      const liked = this.buttonTarget.dataset.liked === "true";
      this.heartTarget.classList.toggle("clicked", liked);
    }
  }

  toggleHeartColor() {
    if (this.hasHeartTarget) {
      this.heartTarget.classList.toggle("clicked");
    }
  }
}
