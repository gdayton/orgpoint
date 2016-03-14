class Location < ActiveRecord::Base
  belongs_to :company
  has_one :user
end
