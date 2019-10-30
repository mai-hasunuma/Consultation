class BoardCommentsController < ApplicationController
  before_action :authenticate_user!, only: :destroy
  before_action :ensure_correct_user, {only: [:destroy]}

  def destroy
    @board_comment = BoardComment.find(params[:id])
    @board_comment.destroy
    redirect_to board_path(@board_comment.board)
  end

  private
  def ensure_correct_user
    @board_comment = BoardComment.find(params[:id])
    if current_user.id != @board_comment.user_id
     redirect_to boards_path
    end
  end
end
