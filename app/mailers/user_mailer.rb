class UserMailer < ActionMailer::Base
	default :from => "OrgPoint Account Services <support@orgpoint.com>"
	
	def registration_confirmation_onboard(user)
		@user = user
		mail(
			:to => "#{@user.first_name} #{@user.last_name} <#{@user.email}>",
			:subject => "OrgPoint Registration Confirmation"
		)
	end
end