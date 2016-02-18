class EditManagerStuff < ActiveRecord::Migration
  def change
	  remove_column :users, :manager
	  add_column :users, :manager_id, :integer
  end
end
