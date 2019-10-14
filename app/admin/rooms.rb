ActiveAdmin.register Room do
  #関連付け(roomの中でroom_commentモデルを出すための関連付け)
  controller do
    def scoped_collection
      Room.includes(:room_comments)
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params
  index do
    selectable_column
    id_column
    column 'ユーザ' do |room|
      room.entry_users.each{|u| puts u.name}
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |b|
    attributes_table do
      row :id
      row :title
      row :content
      panel "コメント一覧" do
        paginated_collection(b.room_comments.page(params[:page]).per(30)) do
          table_for collection do
            column(:user_id)
            column(:content)
          end
        end
      end
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = []
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
