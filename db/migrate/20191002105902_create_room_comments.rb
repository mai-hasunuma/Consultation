# frozen_string_literal: true

class CreateRoomComments < ActiveRecord::Migration[5.2]
  def change
    create_table :room_comments do |t|
      t.integer :room_id
      t.integer :user_id
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
