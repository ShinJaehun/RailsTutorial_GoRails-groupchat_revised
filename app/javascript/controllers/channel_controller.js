import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="channel"
export default class extends Controller {
  static targets = ["messages", "newMessage"]
  connect() {
    console.log("this.data.get.id:" + this.data.get("id"))

    this.subscription = consumer.subscriptions.create({channel: "MessageChannel", id: this.data.get("id")}, {
      connected: this._connected.bind(this),
      disconnected: this._disconnected.bind(this),
      received: this._received.bind(this)
    })
  }

  disconnect(){
    consumer.subscriptions.remove(this.subscription)
  }

  _connected(){}

  _disconnected(){}

  _received(data){
    if(data.message){
      this.messagesTarget.insertAdjacentHTML('beforeend', data.message)
    }
  }

  clearMessage(event){
    this.newMessageTarget.value = ''
  }

}
