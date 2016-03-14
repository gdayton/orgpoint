class Department < ActiveRecord::Base
  belongs_to :company
  has_one :user
end
