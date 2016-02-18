class RemoveManagerId < ActiveRecord::Migration
  def change
	  remove_column :users, :manager_id
  end
end
