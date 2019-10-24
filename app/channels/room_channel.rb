class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    room_comment = RoomComment.new(user_id: current_user.id, room_id: data['room_id'], content: data['message'])
    room_comment.save!
    room = room_comment.room
    room.create_notification_room_comment!(current_user, room_comment.id)
    image = current_user.image
    if current_user.image.attached?
      ActionCable.server.broadcast 'room_channel', {name: current_user.name, message: data['message'], created_at: room_comment.created_at.strftime("%m/%d %H:%M"), image: Rails.application.routes.url_helpers.polymorphic_url(image)}
    else
      ActionCable.server.broadcast 'room_channel', {name: current_user.name, message: data['message'], created_at: room_comment.created_at.strftime("%m/%d %H:%M"), image: nil}
    end
  end
end