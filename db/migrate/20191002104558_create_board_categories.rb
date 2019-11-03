# frozen_string_literal: true

class CreateBoardCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :board_categories do |t|
      t.string :name, null: false, default: ''

      t.timestamps
    end
  end
end
