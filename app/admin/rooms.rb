ActiveAdmin.register Room do

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
      room.entry_users.name
    end
    column :created_at
    column :updated_at
    actions
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
