class AddManagerToUser < ActiveRecord::Migration
  def change
	  add_column :users, :manager, :integer
  end
end
