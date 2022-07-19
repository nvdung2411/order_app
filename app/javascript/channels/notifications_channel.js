import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log("Connect to Notification channel ...")
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log(data)
    // Called when there's incoming data on the websocket for this channel
    $("#notifications").prepend(data.html);
  }
});
