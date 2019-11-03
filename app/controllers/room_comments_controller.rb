# frozen_string_literal: true

class RoomCommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :ensure_correct_user, only: [:destroy]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:room_comment][:room_id], room_id: params[:room_comment]).present?
      @room_comment = RoomComment.create(params.require(:room_comment).permit(:room_id, :user_id, :content, :image).merge(user_id: current_user.id))
      redirect_to "/rooms/#{@room_comment.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @room_comment = RoomComment.find(params[:id])
    @room_comment.destroy
    redirect_to room_path(@room_comment.room)
  end

  private

  def ensure_correct_user
    @room_comment = RoomComment.find_by(id: params[:id])
    redirect_to rooms_path if current_user.id != @room_comment.user_id
  end
end
