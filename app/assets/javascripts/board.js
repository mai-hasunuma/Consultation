// cable.jsが読み込まれなかったのでこちらに記述
//= require action_cable
//= require_self
//= require_tree ./channels

// // channelディレクトリのboard.jsは読み込まれなかったのでこちらに記載
(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();


}).call(this);

