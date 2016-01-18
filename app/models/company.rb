class Company < ActiveRecord::Base
	has_many :locations, class_name: 'Location'
	has_many :departments, class_name: 'Department'
	has_many :employees, class_name: 'User'
	has_one  :ceo, class_name: 'User'
end
