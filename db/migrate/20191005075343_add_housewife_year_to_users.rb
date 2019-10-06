class AddHousewifeYearToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :housewife_year, :integer
  end
end
