class Location < ActiveRecord::Base
  belongs_to :company, class_name: 'Company'
  
  validates :title, presence: true
end
