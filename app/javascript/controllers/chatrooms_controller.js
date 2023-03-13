import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "chatroom"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)

    // Hide all chatrooms by default
    this.chatroomTargets.forEach(chatroom => {
      chatroom.style.display = 'none'
    })
  }
  insertMessageAndScrollDown(data) {
    console.log(data)
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  show(event) {
    event.preventDefault()

    const chatroomId = event.currentTarget.dataset.chatroomId
    const chatroomDiv = document.querySelector(`#chatroom-${chatroomId}`)

    // Hide all other chatrooms
    this.chatroomTargets.forEach(otherChatroom => {
      if (otherChatroom !== chatroomDiv) {
        otherChatroom.style.display = 'none'
      }
    })

    // Show this chatroom
    chatroomDiv.style.display = 'block'
  }

}
