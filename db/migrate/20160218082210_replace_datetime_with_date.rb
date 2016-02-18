class ReplaceDatetimeWithDate < ActiveRecord::Migration
  def change
	  remove_column :users, :start_date
	  add_column :users, :start_date, :date
  end
end
