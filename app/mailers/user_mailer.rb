class UserMailer < ActionMailer::Base
	default :from => "OrgPoint Account Services <support@orgpoint.com>"
	#this method sends email conformation to users who've registered
	def registration_confirmation_onboard(user)
		@user = user
		mail(
			:to => "#{@user.first_name} #{@user.last_name} <#{@user.email}>",
			:subject => "OrgPoint Registration Confirmation"
		)
	end
end
