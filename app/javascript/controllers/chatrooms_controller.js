import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  // static targets = ["messages"]

  connect() {

    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`);
    this.channel = createConsumer().subscriptions.create(
      {
        channel: "ChatroomChannel",
        id: this.chatroomIdValue
      },
      {
        received: (data) => {
          console.log(data);
          this.element.insertAdjacentHTML("beforeend", data)
          this.#insertMessageAndScrollDown(data)
        },
        connected: () => {
          console.log("connect");
        }
      },
    )
  }

  // #insertMessageAndScrollDown(data) {
  //   this.element.insertAdjacentHTML("beforeend", data)
  //   this.element.scrollTo(0, this.element.scrollHeight)
  // }
}
