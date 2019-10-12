class RoomCommentsController < ApplicationController
  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:room_comment][:room_id]).present?
      @room_comment = RoomComment.create(params.require(:room_comment).permit(:room_id, :user_id, :content, :image).merge(:user_id => current_user.id))
      redirect_to "/rooms/#{@room_comment.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
