# frozen_string_literal: true

ActiveAdmin.register Room do
  # 関連付け(roomの中でroom_commentモデルを出すための関連付け)
  controller do
    def scoped_collection
      Room.includes(:room_comments)
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  # room_comments_attributes: [:id, :user_id, :content, :_destroy]: ルームのページでroom_commentの編集削除を可能にする,
  # room_commentテーブルのカラムであるid,user_idもストロングパラメータに追加すること
  permit_params room_comments_attributes: %i[id user_id content _destroy]
  index do
    selectable_column
    id_column
    column 'ユーザ' do |room|
      room.entry_users.each { |u| puts u.name }
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |b|
    attributes_table do
      row :id
      row 'ユーザ' do |room|
        room.entry_users.each { |u| puts u.name }
      end
      panel 'コメント一覧' do
        paginated_collection(b.room_comments.page(params[:page]).per(30)) do
          table_for collection do
            column(:user_id)
            column(:content)
          end
        end
      end
    end
  end

  form do |f|
    # board_commentの編集削除　https://qiita.com/Yinaura/items/e4cad1b59afe08b7de11
    f.inputs do
      f.has_many :room_comments, allow_destroy: true do |t|
        t.input :content
      end
    end
    f.actions
  end
end
