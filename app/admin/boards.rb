ActiveAdmin.register Board do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :content, :image
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

  # 反映されず、不明
  show do |board|
    attributes_table(*board.class.columns.collect { |column| column.name.to_sym })
    panel "コメント一覧" do
      table_for board.board_comments do
        column :use_id
        column :content
      end
    end
  end

  form do |f|
    f.inputs "Boards" do
      f.input :user_id, as: :select, :member_label => :users
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
