class Company < ActiveRecord::Base
	has_attached_file :image,
                :styles => { 
	                small: '150x150'
	            },
                :default_url => "/images/:style/missing.png",
                :s3_host_name => "s3-us-west-1.amazonaws.com",
                :storage => :s3,
                :bucket => "orgpoint",
                :s3_protocol => :https,
                :s3_credentials => { 
	                :access_key_id => "AKIAJXFJLRPQ3ASZSJIQ", 
	                :secret_access_key => "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", 
	                :bucket => "orgpoint"
	            }
  
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
	has_many :locations
	has_many :departments
	has_many :users
end
