class RemovePermsPDigVerifToken < ActiveRecord::Migration
  def change
	  remove_column :users, :permissions
	  remove_column :users, :password_digest
	  remove_column :users, :verified
	  remove_column :users, :verified_token
  end
end
