class BoardChannel < ApplicationCable::Channel
  def subscribed
    # どのチャンネルを購読するか指定する
    stream_from "board_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  #購読しているチャンネルにメッセージを配信する記載
  def speak(data)
    board_comment = BoardComment.create!(user_id: current_user.id, board_id: data['board_id'], content: data['message'])
    ActionCable.server.broadcast 'board_channel', {name: by +current_user.name, message: data['message']}
  end
end
