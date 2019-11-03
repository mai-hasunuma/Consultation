# frozen_string_literal: true

class AddDeletedAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted_at, :string
  end
end
