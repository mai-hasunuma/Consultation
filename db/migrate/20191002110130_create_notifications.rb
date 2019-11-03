# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :board_comment_id
      t.integer :room_comment_id
      t.string :action
      t.boolean :check, null: false, default: 'false'

      t.timestamps
    end
  end
end
