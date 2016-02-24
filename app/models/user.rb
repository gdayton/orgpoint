require 'csv'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  ROLES = %w[superadmin admin employee banned].freeze
  
  validates :email, :presence => true, :uniqueness => true
  
  has_attached_file :image,
                :styles => { 
	                small: '64x64#',
					med: '100x100',
					large: '400x400'
	            },
                :default_url => "/images/:style/missing.png",
                :s3_host_name => "s3-us-west-1.amazonaws.com",
                :s3_protocol => :https,
                :storage => :s3,
                :bucket => "orgpoint",
                :s3_credentials => { 
	                :access_key_id => "AKIAJXFJLRPQ3ASZSJIQ", 
	                :secret_access_key => "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", 
	                :bucket => "orgpoint"
	            }
  
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  belongs_to :company
  belongs_to :manager, class_name: "User"
  has_many :posts
  has_many :comments
  has_many :photos
  
  def self.import(file,company)
	ss = open_spreadsheet(file)
	header = ss.row(1)
	(2..ss.last_row).each do |i|
		row = Hash[[header, ss.row(i)].transpose]
		user = new
		user.first_name = row["first_name"]
		user.last_name = row["last_name"]
		user.email = row["email"]
		user.password = row["password"]
		user.password_confirmation = row["password_confirmation"]
		user.company = company
		#user.attributes = row.to_hash.slice(["id", "first_name", "last_name", "email", "password", "password_confirmation"])
		user.save!
	end
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, csv_options: {col_sep: ","})
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
  def reports
	users = User.where(manager_id: self.id)
  end
  
  def coworkers
	begin
		manager = User.find(self.manager_id)
	rescue ActiveRecord::RecordNotFound
		return []
	end
	coworkers = manager.reports.order(last_name: :desc)
  end
  
  #returns a size 2 array, with 3 possibilities, [nil, nil], [nil, USER], [USER, nil]
  def coworkers_disp
	coworkers = self.coworkers
	coworkers_count = coworkers.count
	if coworkers_count > 0
		# find the location of the current user in the Array
		indexloc = coworkers.index(self)
		
		returnArray = [nil,nil]
		
		# handle the left side
		if indexloc != 0
			returnArray[0] = coworkers[indexloc - 1]
		end
		
		# handle the right side
		if indexloc != (coworkers_count - 1)
			returnArray[1] = coworkers[indexloc + 1]
		end
			
		return returnArray
	else
		return [nil,nil]
	end
  end
end
