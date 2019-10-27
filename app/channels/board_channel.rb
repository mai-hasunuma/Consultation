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
    board_comment = BoardComment.new(user_id: current_user.id, board_id: data['board_id'], content: data['message'])
    board_comment.save!
    board = board_comment.board
    board.create_notification_board_comment!(current_user, board_comment.id)
    image = current_user.image
    # image部分については右記URLを参照（actiestorageで取得したURLの表示）　actioncableurlhttps://shinkufencer.hateblo.jp/entry/2018/07/25/230537
    if current_user.image.attached?
      ActionCable.server.broadcast 'board_channel', {name: current_user.name, message: data['message'], created_at: board_comment.created_at.strftime("%m/%d %H:%M"), id: board_comment.id ,image: Rails.application.routes.url_helpers.polymorphic_url(image)}
    else
      ActionCable.server.broadcast 'board_channel', {name: current_user.name, message: data['message'], created_at: board_comment.created_at.strftime("%m/%d %H:%M"), id: board_comment.id , image: nil}
    end
  end
end
