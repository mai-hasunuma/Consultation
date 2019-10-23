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
      @b = Board.ransack(board_comments_content_or_title_or_content_cont_any: nil)
      @boards = @b.result(distinct: true).page(params[:page]).per(10)
      return
    end

    # 全角スペース　半角スペースを分ける
    search_words = params[:q][:title_or_content_cont].split(/[,\n\p{blank}]+/)

    # board_commentテーブルのcontent title、boardテーブルのcontentから検索
    # contを最後に書くことでlike検索が実装できるようになる
    # orで複数カラムを選択
    # any 1つ以上の単語が検索可能　http://nekorails.hatenablog.com/entry/2017/05/31/173925
    @b = Board.ransack(board_comments_content_or_title_or_content_cont_any: search_words)
    @boards = @b.result(distinct: true).page(params[:page]).per(10)
  end

  def search
    @b = BoardCategory.search(search_params)
    @boards = @b.result(distinct: true).page(params[:page]).per(10)
  end

  private
  def board_params
    params.require(:board).permit(:title, :content, images: [], board_category_ids: [] )
  end

  def search_params
    params.require(:q).permit!
  end

end
