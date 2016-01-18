class Company < ActiveRecord::Base
	has_many :locations
	has_many :departments
	has_many :employees, class_name: 'User'
	has_one  :ceo, class_name: 'User'
end
