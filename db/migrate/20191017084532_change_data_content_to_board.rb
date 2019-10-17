class ChangeDataContentToBoard < ActiveRecord::Migration[5.2]
  def change
    change_column :boards, :content, :text
  end
end
