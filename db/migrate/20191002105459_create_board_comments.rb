# frozen_string_literal: true

class CreateBoardComments < ActiveRecord::Migration[5.2]
  def change
    create_table :board_comments do |t|
      t.integer :board_id
      t.integer :user_id
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
