class User < ActiveRecord::Base
  before_create :verification_token
  
  has_secure_password
  
  validates :email, :presence => true, :uniqueness => true
  
  belongs_to :company
  
  private
  
  def verification_token
	  if self.verified_token.blank?
		  self.verified_token = SecureRandom.urlsafe_base64.to_s
	  end
  end
  
  def email_verified
	  self.verified = true
	  self.verified_token = nil
	  save!(:validate => false)
  end
  
  def find_by_confirm_token(token)
	  u = User.where(verification_token: token)
	  if u
		  return u
	  else
	  	  return nil
	  end
  end
  
end
