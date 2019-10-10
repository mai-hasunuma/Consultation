class BoardsController < ApplicationController
  def new
    @board = Board.new
    @board_categories = BoardCategory.all
    @board_category = @board.board_categories.build
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    @board.save
      #   @board.board_categories.each do |b|
      #     @board_category = BoardCategory.new
      #     @board_category.id = b.id
      #     @board_category.name = b.name
      #   end
      # end
    redirect_to boards_path
  end

  def edit
    @board = Board.find(params[:id])
    @board_categories = BoardCategory.all
    @board_category = @board.board_categories.build
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    binding.pry
    redirect_to board_path(@board)
  end

  def show
    @board = Board.find(params[:id])
    @board_comments = BoardComment.all
  end

  def index
    @b = Board.ransack(params[:q])
    @board_categories = BoardCategory.all
    @boards = @b.result(distinct: true)
  end

  def search
    @b = BoardCategory.search(search_params)
    @boards = @b.result(distinct: true)
  end

  private
  def board_params
    params.require(:board).permit(:title, :content, images: [], board_category_ids: [] )
  end
  def search_params
    params.require(:q).permit!
  end
end
