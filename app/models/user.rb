require 'csv'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :email, :presence => true, :uniqueness => true
  
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "400x400" }
  
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
  belongs_to :company
  
  def self.import(file,company)
	ss = open_spreadsheet(file)
	header = ss.row(1)
	(2..ss.last_row).each do |i|
		row = Hash[[header, ss.row(i)].transpose]
		user = find_by_id(row["id"]) || new
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
end
