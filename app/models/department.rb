class Department < ActiveRecord::Base
  belongs_to :company
  
  validates :title, presence: true
end
