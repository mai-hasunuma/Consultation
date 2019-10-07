class UsersController < ApplicationController


  def edit
    @user = User.find(params[:id])
    @trouble_categories = TroubleCategory.all
    @user.current_troubles.find_or_initialize_by(user_id: @user.id)
    @user.past_troubles.find_or_initialize_by(user_id: @user.id)
    # binding.pry
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
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
      puts "success"
    end
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])

  end

  def index
    @q = User.ransack(params[:q])
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
                               {trouble_category_ids: []},
                               # {past_trouble_ids: []},
                               #current_troubles_attributes: [ :id, :user_id, :trouble_category_id, :_destroy ],
                               #past_troubles_attributes: [ :id, :user_id, :trouble_category_id, :_destroy ]
                               )
  end

  def search_params
    params.require(:q).permit!
  end

end
