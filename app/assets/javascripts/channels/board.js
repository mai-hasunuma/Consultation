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
    // pタグを作成する
    var newMessage = document.createElement('span');
    // .innerText;先ほどnewMessageで作成したpタグの要素の中身をmessageに変える（今回はpタグの中に文字を入れる）
    newMessage.innerText = data.message;
    // 親要素　id=chatの中にnewMessageを入れる
    chat.appendChild(newMessage);
    //ココマデ

　　 // プロフィール画像表示
    var newUserImage = document.createElement('img');
    if(data.image){
      newUserImage.src = data.image;
    }else{
      newUserImage.src = "/no_image.png";
      newUserImage.width = 40;
      newUserImage.height = 40;
    };
    chat.appendChild(newUserImage);

    //以下ユーザ名表示
    //ココマラ
    var newUser = document.createElement('p');
    newUser.innerText = data.name;
    chat.appendChild(newUser);
    //ここまで
  },

  speak: function(message) {
    return this.perform('speak', {
      message: message,
      name: name,
      // 掲示板コメントテーブルで掲示板idを持っているので、URL boards/:idのidからURLを取得（URLの一番最後から取得する）
      board_id: window.location.pathname.split('/').slice(-1)[0],
    });
  }
});
