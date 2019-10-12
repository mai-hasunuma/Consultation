class RemoveNameFromRooms < ActiveRecord::Migration[5.2]
  def up
    remove_column :rooms, :name
  end

  def down
    add_column :rooms, :name, :string
  end
end
