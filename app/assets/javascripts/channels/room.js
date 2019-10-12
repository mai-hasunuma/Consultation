App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    var chat = document.getElementById('chat');
    var newMessage = document.createElement('span');
    newMessage.innerText = data.message;
    chat.appendChild(newMessage);

    var newUserImage = document.createElement('img');
    newUserImage.src = data.image;
    chat.appendChild(newUserImage);

    var newUser = document.createElement('p');
    newUser.innerText = data.name;
    chat.appendChild(newUser);
  },

  speak: function(message) {
    return this.perform('speak', {
      message: message,
      name: name,
      room_id: window.location.pathname.split('/').slice(-1)[0],
    });
  }
});
