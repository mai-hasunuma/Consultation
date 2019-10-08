class UsersController < ApplicationController


  def edit
    @user = User.find(params[:id])
    @trouble_categories = TroubleCategory.all
    @user.current_troubles.find_or_initialize_by(user_id: @user.id)
    @user.past_troubles.find_or_initialize_by(user_id: @user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
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
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])

  end

  def index
    @q = User.ransack(params[:q])
    @trouble_categories = TroubleCategory.all
    @users = @q.result(distinct: true)
  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true)
  end

  protected
  # 追記する
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private
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
