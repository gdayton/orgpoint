class UserMailer < ActionMailer::Base
	default :from => "support@orgpoint.com"
	
	def registration_confirmation_onboard(user)
		@user = user
		mail(
			:to => @user.email,
			:subject => "OrgPoint Registration Confirmation"
		)
	end
end