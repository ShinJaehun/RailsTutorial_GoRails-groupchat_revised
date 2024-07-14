import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

export default class extends Controller {
  static targets=["mentions"]
  connect() {
    this.username=document.querySelector("meta[name='username']").getAttribute("content")
    //console.log("this.username:" + this.username)
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
    //console.log("이게 되긴 되는거냥?")
    this.element.classList.add("fw-bold")
    // 이거는 정상 작동함

    if(data.mentions&&data.mentions.includes(this.username)){
    // 근데 이건 동작하지 않음, mention 관련해서 뭔가 해야 하나봄...
    // 그 왜 @누구 해서 전달하는 거...
      let count = parseInt(this.mentionsTarget.textContent)
      console.log("count: " + count)
      this.mentionsTarget.textContent=count+1
      this.mentionsTarget.removeAttribute("hidden")
      this.notify(data.body)
    }
  }

  notify(message){
    if(!("Notification" in window)){
      console.error("이 브라우저는 notification을 지원하지 않습니다.")
    }else if(Notification.permission === "granted"){
      var notification = new Notification(message)
    }
  }
}
