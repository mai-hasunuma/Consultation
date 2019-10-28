class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}


  def edit
    @user = User.find(params[:id])
    @trouble_categories = TroubleCategory.all
    @user.current_troubles.find_or_initialize_by(user_id: @user.id)
    @user.past_troubles.find_or_initialize_by(user_id: @user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      @trouble_categories = TroubleCategory.all
      @user.current_troubles.find_or_initialize_by(user_id: @user.id)
      @user.past_troubles.find_or_initialize_by(user_id: @user.id)
      render 'edit'
    end
      # current_trouble_category_idとpast_trouble_category_idを受け渡しているので下記の記述は不要となる
      # ここから
      # params[:user][:current_troubles][:trouble_category_ids].each do |current_trouble|
      #   a = CurrentTrouble.new
      #   a.user_id = current_user.id.to_i
      #   a.trouble_category_id = current_trouble.to_i
      #   a.save!
      # end

      # params[:user][:past_troubles][:trouble_category_ids].each do |past_trouble|
      #   b = PastTrouble.new
      #   b.user_id = current_user.id.to_i
      #   b.trouble_category_id = past_trouble.to_i
      #   b.save!
      # end
      # ここまで
  end

  def show
    @user = User.find(params[:id])
    # binding.pry
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      if @user.id == current_user.id
      else
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def index

    if user_signed_in?
      current_user_current_trouble_ids = current_user.current_trouble_category_ids
      users = User.all.page(params[:page]).all.page(params[:page]).per(10)
      matched_current_trouble_count_hash = {}
      # おすすめユーザ表示
      users.each do |user|
        unless user == current_user
          other_user_current_trouble_ids = user.past_trouble_category_ids
          matched_current_trouble_ids = current_user_current_trouble_ids & other_user_current_trouble_ids
          matched_current_trouble_count_hash.merge!(user.id => matched_current_trouble_ids.count)
        end
      end
      # value順に並び替える　.sort_by{ |_, v| -v } https://qiita.com/mnishiguchi/items/9095ac989ed7d51fe395
      @recommended_order = Hash[ matched_current_trouble_count_hash.sort_by{ |_, v| -v } ]
    end

    # 検索機能
    @q = User.ransack(params[:q])
    @trouble_categories = TroubleCategory.all

    if params[:q].blank?
      @q = User.ransack(introduction_cont_any: nil)
      @users = @q.result(distinct: true).page(params[:page]).per(10)
      return
    end
    # binding.pry
    search_words = params[:q][:introduction_cont_any].split(/[,\n\p{blank}]+/)
    @q = User.ransack(housewife_year_gteq: params[:q][:housewife_year_gteq], housewife_year_lt: params[:q][:housewife_year_lt],
       introduction_cont_any: search_words, current_trouble_categories_id_in: params[:q][:current_trouble_categories_id_in], past_trouble_categories_id_in: params[:q][:past_trouble_categories_id_in])
    @users = @q.result(distinct: true).page(params[:page]).per(10)

  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def destroy
    current_user.destroy
    #コントローラでログアウトするときは下記のように書く
    sign_out current_user
    redirect_to root_path
  end

  protected
  # 追記する
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private
  def ensure_correct_user
    @user = User.find_by(id: params[:id])
    if current_user.id != @user.id
     redirect_to users_path
    end
  end


  def user_params
  params.require(:user).permit(:name, :housewife_year, :image, :introduction,
                               {current_trouble_category_ids: []},
                               {past_trouble_category_ids: []},
                               )
  end

  def search_params
    params.require(:q).permit(:introduction_cont, :housewife_year_gteq, :housewife_year_lt,
                              {current_trouble_categories_id_in: []},
                              {past_trouble_categories_id_in: []},
                              )
  end

end
