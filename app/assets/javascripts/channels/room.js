App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log(data)
    // chatというIDの属性要素を取得する
    var chat = document.getElementById('chat');
    //以下メッセージ作成
    //ココカラ
    var row = document.createElement('div');
    row.className = "row";
    var col7 = document.createElement('div');
    col7.className = "col-md-7";
    row.appendChild(col7);

    var col3 = document.createElement('div');
    col3.className = "col-md-3";
    var textleft = document.createElement('div');
    textleft.style = "text-align: left;";
    textleft.innerText = data.message;

　　var deletelinkdiv = document.createElement('div')
    deletelinkdiv.style = "margin-left: 210px;"

    var deletelink = document.createElement('a');
    deletelink.style = "text-decoration: none; color: #565656; font-size: 15px;"
    deletelink.rel = "nofollow"
    deletelink.setAttribute('data-confirm', '削除しますか？')
    deletelink.href = "/room_comments/" + data.id;
    deletelink.setAttribute('data-method', 'delete')

    var trash = document.createElement('i');
    trash.className = "fas fa-trash";
    trash.innerText = "削除";
    trash.addAriaHidden = "true";

    deletelink.appendChild(trash);
    deletelinkdiv.appendChild(deletelink);

    var username = document.createElement('p');
    username.style = "text-align: right; font-size: 10px;";
    username.innerText = "by " + data.name  + " " + data.created_at;

　　textleft.appendChild(deletelinkdiv);
    textleft.appendChild(username);

    col3.appendChild(textleft);

    row.appendChild(col3);

    var col1 = document.createElement('div');
    col1.className = "col-md-1";

    var newUserImage = document.createElement('img');
    if(data.image){
      newUserImage.src = data.image;
      newUserImage.width = 50;
      newUserImage.height = 50;
    }else{
      newUserImage.src = "/no_image.png";
      newUserImage.width = 50;
      newUserImage.height = 50;
    };

    col1.appendChild(newUserImage);

    row.appendChild(col1);

    chat.appendChild(row);

    chat.scrollTop = chat.scrollHeight;
  },

  speak: function(message) {
    return this.perform('speak', {
      message: message,
      name: name,
      room_id: window.location.pathname.split('/').slice(-1)[0],
    });
  }
});
