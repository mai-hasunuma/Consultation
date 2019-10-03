class CreateBoardSelectedCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :board_selected_categories do |t|
      t.integer :board_id
      t.integer :board_category_id

      t.timestamps
    end
  end
end
