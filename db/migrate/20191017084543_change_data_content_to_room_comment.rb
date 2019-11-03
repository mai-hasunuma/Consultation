# frozen_string_literal: true

class ChangeDataContentToRoomComment < ActiveRecord::Migration[5.2]
  def change
    change_column :room_comments, :content, :text
  end
end
