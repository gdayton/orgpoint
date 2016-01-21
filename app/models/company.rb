class Company < ActiveRecord::Base
	has_many :locations
	has_many :departments
	has_many :users
end
