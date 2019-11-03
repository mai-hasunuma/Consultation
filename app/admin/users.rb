# frozen_string_literal: true

ActiveAdmin.register User do
  # action_cableを使ってparanoiaで論理削除をする時はgemを追加してからこの記述をする　参考url https://github.com/raihan2006i/active_admin_paranoia
  active_admin_paranoia

  # 削除済みのデータも取得するようにscopeを変更
  controller do
    def scoped_collection
      User.with_deleted
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :deleted_at, :name, :housewife_year, :image, :introduction
  permit_params :email, :password, :name, :housewife_year, :image, :introduction, :deleted_at,
                { current_trouble_category_ids: [] }, past_trouble_category_ids: []
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :deleted do |f|
      f.deleted_at ? '削除' : nil # 削除済みの場合は"削除"と表示
    end
    column :housewife_year
    column :introduction
    # adはアクティブストレジのオブジェクト(user.image.activestorage.imageで画像データが表示される)adはactivestorageに値する
    column :image do |as|
      image_tag url_for(as.image) if as.image.attached?
    end
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

  show do |_b|
    attributes_table do
      row :name
      row :email
      row :deleted_at
      row :housewife_year
      row :introduction
      row :image do |as|
        image_tag url_for(as.image) if as.image.attached?
      end
    end
  end

  form do |f|
    f.inputs 'Users' do
      f.input :email
      f.input :name
      f.input :housewife_year
      f.input :image, as: :file
      f.input :introduction
      f.input :current_trouble_categories, as: :check_boxes
      f.input :past_trouble_categories, as: :check_boxes
      f.input :deleted_at
      f.input :password
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
