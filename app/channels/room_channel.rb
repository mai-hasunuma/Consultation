class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    room_comment = RoomComment.create!(user_id: current_user.id, room_id: data['room_id'], content: data['message'])
    image = User.find(current_user.id).image
    ActionCable.server.broadcast 'room_channel', {name: current_user.name, message: data['message'], image: Rails.application.routes.url_helpers.polymorphic_url(image)}
  end
end

