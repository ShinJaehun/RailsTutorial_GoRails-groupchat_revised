import consumer from "channels/consumer"

consumer.subscriptions.create("UnreadsChannel", {
  connected(){},
  disconnected(){},
  received(data){},
});
