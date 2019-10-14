ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :deleted_at, :name, :housewife_year, :image, :introduction
  permit_params :email, :password, :name, :housewife_year, :image, :introduction, :deleted_at
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :deleted_at
    column :housewife_year
    column :introduction
    column :image
    column :created_at
    column :updated_at
    actions
  end

  filter :current_trouble_categories
  filter :past_trouble_categories
  filter :email
  filter :name
  filter :housewife_year
  filter :introduction


  form do |f|
      f.inputs "Users" do
        f.input :email
        f.input :password
        f.input :name
        f.input :housewife_year
        f.input :image, :as => :file
        f.input :introduction
        f.input :deleted_at
      end
      f.actions
    end
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :deleted_at, :name, :housewife_year, :image, :introduction]
  #   # permitted << :other if params[:action] == 'create' && current_user.admin?
  #   # permitted
  # end

end
