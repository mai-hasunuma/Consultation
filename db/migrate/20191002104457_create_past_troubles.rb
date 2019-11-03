# frozen_string_literal: true

class CreatePastTroubles < ActiveRecord::Migration[5.2]
  def change
    create_table :past_troubles do |t|
      t.integer :user_id
      t.integer :trouble_category_id

      t.timestamps
    end
  end
end
