class RemoveHousewifeYearFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :housewife_year, :integer
  end
end
