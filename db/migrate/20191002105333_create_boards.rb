class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :user_id
      t.string :title, null: false, default: ""
      t.text :content, null: false, default: ""
      t.string :image

      t.timestamps
    end
  end
end
