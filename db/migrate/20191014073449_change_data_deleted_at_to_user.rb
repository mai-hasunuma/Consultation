# frozen_string_literal: true

class ChangeDataDeletedAtToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :deleted_at, :datetime
  end
end
