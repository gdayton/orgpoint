class AddValuesToUser < ActiveRecord::Migration
  def change
	  add_column :users, :mobile_phone, :string
	  add_column :users, :work_phone, :string
	  add_column :users, :start_date, :datetime
	  add_column :users, :video_platform, :integer
	  add_column :users, :video_handle, :string
  end
end
