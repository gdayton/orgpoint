class Photo < ActiveRecord::Base
	
  has_attached_file :image, styles: { small: "125x125#", med: "400x400", large: "800x800" }
  
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  belongs_to :user
end
