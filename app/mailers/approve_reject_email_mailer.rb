class ApproveRejectEmailMailer < ApplicationMailer
	
	def email_approval(user, project)
		@user = user
		@project = project
		mail(to: 'd.timothy.freeman@gmail.com', subject: "#{@project.title}, was approved!")
	end

	def email_rejection(user, project)
		@user = user
		@project = project
		mail(to: 'd.timothy.freeman@gmail.com', subject: "#{@project.title}, was rejected.")
	end

end
