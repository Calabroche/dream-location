// app/javascript/controllers/conversation_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messages"]

  show(event) {
    event.preventDefault();
    let url = event.currentTarget.getAttribute("href");
    fetch(url, { headers: { "X-Requested-With": "XMLHttpRequest" } })
      .then(response => response.text())
      .then(html => {
        this.element.insertAdjacentHTML("afterend", html);
        this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight;
      });
  }
}
