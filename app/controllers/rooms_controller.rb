class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :index]

  def create
    @room = Room.new
    @room.save
    @entry1 = Entry.new
    @entry1.room_id = @room.id
    @entry1.user_id = current_user.id
    @entry1.save
    # create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.new
    @entry2.room_id = @room.id
    @entry2.user_id = params[:entry][:user_id]
    @entry2.save
    # create(room_id: @room.id, user_id: params[:entry][:user_id])
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @room_comments = @room.room_comments
      @room_comment = RoomComment.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @entry_rooms = current_user.entry_rooms.page(params[:page]).per(10)
    @room_comments = RoomComment.page(params[:page])
  end


end
