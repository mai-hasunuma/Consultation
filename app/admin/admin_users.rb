# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  # 一覧画面
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  # 一覧画面の右側の検索
  filter :email
  filter :created_at

  # 新規作成、編集画面のフォーム
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
