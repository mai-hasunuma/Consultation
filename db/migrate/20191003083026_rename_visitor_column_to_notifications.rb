class RenameVisitorColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :visitor_id, :visiter_id
  end
end
