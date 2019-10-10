class RoomsController < ApplicationController
  def show
    protect_room(params[:id])
    @room = Room.find(params[:id])
  end

  def create
    @r = find_room(params[:id])

    if @r
      redirect_to "/rooms/{@r.id}"

    else
      @room = Room.new(name: "room@#{params[:id]}@#{current_user.id}")
      @room.save
      redirect_to "/rooms/#{@room.id}"
    end
  end

  def index
  end

  
end
