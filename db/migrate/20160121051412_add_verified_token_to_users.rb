class AddVerifiedTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verified_token, :string
  end
end
