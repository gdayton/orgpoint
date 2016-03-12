class AddPostsToCompany < ActiveRecord::Migration
  def change
    add_reference :posts, :company, index: true
  end
end
