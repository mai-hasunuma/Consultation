class UsersController < ApplicationController


  def edit
    @user = User.find(params[:id])
    @trouble_categories = TroubleCategory.all
    @user.current_troubles.build
    @user.past_troubles.build
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      params[:user][:current_troubles][:trouble_category_ids].each do |current_trouble|
        a = CurrentTrouble.new
        a.user_id = current_user.id.to_i
        a.trouble_category_id = current_trouble.to_i
        a.save!
      end

      params[:user][:past_troubles][:trouble_category_ids].each do |past_trouble|
        b = PastTrouble.new
        b.user_id = current_user.id.to_i
        b.trouble_category_id = past_trouble.to_i
        b.save!
      end
    end
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])

  end

  def index
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:name, :housewife_year, :image, :introduction, { trouble_category_ids: [] })
  end
  protected
  # 追記する
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end