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
    redirect_to board_path(@board)
  end

  def show
    @board = Board.find(params[:id])
    @board_comments = @board.board_comments
  end

  def index
    #@b = Board.ransack(params[:q])
    @board_categories = BoardCategory.all
    if params[:q].blank?
      @b = Board.ransack(board_comments_content_or_title_or_content_eq_any: nil)
      @boards = @b.result(distinct: true)
      return
    end

    logger.debug("//////////")
    search_words = params[:q][:title_or_content_cont].split(/[,\n\p{blank}]+/)
    @b = Board.ransack(board_comments_content_or_title_or_content_eq_any: search_words)
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

  def custom_search_q
    q_hash = params[:q]
    case q_hash[:custom_search][:cost_entries]
    when 'price_and_cost_present_true' # OR条件がYesの場合
      custom_or_q = {
        price_and_b_tables_cost_not_null: true,
        price_and_fee_not_null: true,
        m: 'or'
      }
      @cost_entries_present = true
    end
  end
end
