import consumer from "channels/consumer"

consumer.subscriptions.create("MessageChannel", {
  connected(){},
  disconnected(){},
  received(data){},
});
