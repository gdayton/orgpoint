class AddAboutRespToUser < ActiveRecord::Migration
  def change
    add_column :users, :about_me, :text
    add_column :users, :resp, :text
  end
end
