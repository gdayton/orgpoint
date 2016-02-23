class AddJobRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :job_role, :string
  end
end
