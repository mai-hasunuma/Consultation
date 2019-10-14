ActiveAdmin.register Board do
  #関連付け
  controller do
    def scoped_collection
      Board.includes(:board_comments)
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #board_comments_attributes: [:content, :_destroy]: ボードのページでboard_commentの編集削除を可能にする
  permit_params :title, :content, :image, board_comments_attributes: [:content, :_destroy]
  index do
    selectable_column
    id_column
    column :user
    column :title
    column :content
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :content
  filter :board_categories
  filter :board_comments


  show do |b|
    attributes_table do
      row :id
      row :title
      row :content
      panel "コメント一覧" do
        paginated_collection(b.board_comments.page(params[:page]).per(30)) do
          table_for collection do
            column(:user_id)
            column(:content)
            # board_commentの編集削除　https://qiita.com/Yinaura/items/e4cad1b59afe08b7de11
            form do |f|
              f.inputs do
                f.has_many :board_comments, allow_destroy: true do |t|
                  t.input :content
                end
              end

              f.inputs do
                f.has_many :board_comments, allow_destroy: true do |t|
                  t.input :_destroy, as: :boolean
                end
              end
              f.actions
            end
          end
        end
      end
    end
  end

  form do |f|
    f.inputs "Boards" do
      f.input :user_id, as: :select, collection: User.all.map{|u|[u.name, u.id]}
      f.input :title
      f.input :content
      f.input :image, :as => :file
    end
      f.actions
  end



  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :content, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
