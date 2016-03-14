class ChangeDepartmentAndLocation < ActiveRecord::Migration
  def change
	  remove_column :users, :departments_id, index: true
	  remove_column :users, :locations_id, index: true
  end
end
