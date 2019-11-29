App.board = App.cable.subscriptions.create("BoardChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // dataが複数の時は下記のようにdata.messsageなどとして受け取れるように配列でデータを送るようにboard_channel.rbに定義する
    // console.log(data.message)
    // console.log(data.user_id)
    // Called when there's incoming data on the websocket for this channel
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
    //debugger
    var textleft = document.createElement('div');
    textleft.style = "text-align: left;";
    textleft.innerText = data.message;

　　var deletelinkdiv = document.createElement('div')
    deletelinkdiv.style = "margin-left: 210px;"

    var deletelink = document.createElement('a');
    deletelink.style = "text-decoration: none; color: #565656; font-size: 15px;"
    // dataconfirm
    deletelink.rel = "nofollow"
    deletelink.setAttribute('data-confirm', '削除しますか？')
    deletelink.href = "/board_comments/" + data.id;
    deletelink.setAttribute('data-method', 'delete')

    var trash = document.createElement('i');
    trash.className = "fas fa-trash";
    trash.innerText = "削除";
    trash.addAriaHidden = "true";

    deletelink.appendChild(trash);
    deletelinkdiv.appendChild(deletelink);

    var username = document.createElement('p');
    username.style = "text-align: right; font-size: 10px;";
    username.innerText = "by " + data.name + data.created_at;

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
      // name: name,
      // 掲示板コメントテーブルで掲示板idを持っているので、URL boards/:idのidからURLを取得（URLの一番最後から取得する）
      // window.location.pathnameで"/boards/1"
      // window.location.pathname.split('/')で["", "boards", "1"]
      // window.location.pathname.split('/1').slice(-1)で["1"]（配列で取得）
      // window.location.pathname.split('/').slice(-1)[0]で配列の0番目を取得し、"1"
      board_id: window.location.pathname.split('/').slice(-1)[0],
    });
  }
});
