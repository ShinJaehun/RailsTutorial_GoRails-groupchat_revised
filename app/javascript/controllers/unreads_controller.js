import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"
//import { FetchRequest } from "@rails/request.js"

export default class extends Controller {
  static values={url: String}
  static targets=["mentions"]
  connect() {
    this.username=document.querySelector("meta[name='username']").getAttribute("content")
    this.subscription=consumer.subscriptions.create({channel: "UnreadsChannel", id: this.data.get("id")}, {
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
    console.log(data)
    this.element.classList.add("fw-bold")

    if(data.mention&&data.mention.includes(this.username)){
      console.log("걸렸다!")
      if (this.hasMentionsTarget){
        console.log(this.mentionsTarget)
      }

      let count = parseInt(this.mentionsTarget.textContent)
      console.log("count: " + count)
      this.mentionsTarget.textContent=count+1
      this.mentionsTarget.removeAttribute("hidden")
      this.notify(data.mention, data.user, data.body)
    }
  }

  async notify(to, from, message){
    event.preventDefault()
    console.log(this.urlValue)
    const csrfToken = document.querySelector("[name='csrf-token']").content

    fetch(this.urlValue, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({
        to: to,
        from: from,
        message: message
      })
    })
    //.then(res => res.json())
    //.then(response => console.log('success:', JSON.stringify(response))
    //.catch(error => console.log('error:', error))

    //console.log(message)
    //console.log("notification 생성!")
    //var notification = new Notification(message)
//    if(!("Notification" in window)){
//      console.error("이 브라우저는 notification을 지원하지 않습니다.")
//    }else if(Notification.permission === "granted"){
//      console.log("notification 생성!")
//      var notification = new Notification(message)
//    }
  }
}
