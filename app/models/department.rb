class Department < ActiveRecord::Base
	validates :title, presence: true
	
	belongs_to :company
end
