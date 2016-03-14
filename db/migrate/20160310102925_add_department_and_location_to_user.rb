class AddDepartmentAndLocationToUser < ActiveRecord::Migration
  def change
	  add_reference :users, :department, index: true
	  add_reference :users, :location, index: true 
  end
end
