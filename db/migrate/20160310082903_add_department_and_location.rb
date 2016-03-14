class AddDepartmentAndLocation < ActiveRecord::Migration
  def change
	add_reference :users, :departments, index: true
	add_reference :users, :locations, index: true
  end
end
