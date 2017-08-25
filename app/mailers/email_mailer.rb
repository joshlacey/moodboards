class EmailMailer < ApplicationMailer
	
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

	def email_user(user, subject, body)
		@user = user
		@body = body
		mail(to: 'd.timothy.freeman@gmail.com', subject: subject)
	end

	def notify_image_comment(user, comment)
		@user = user
		@comment = comment
		mail(to: 'd.timothy.freeman@gmail.com', subject: "#{@comment.user.full_name} just commented on an image in #{@comment.image.board.project.title}!")
	end

	def notify_board_comment(user, comment)
		@user = user
		@comment = comment
		mail(to: 'd.timothy.freeman@gmail.com', subject: "#{@comment.user.full_name} just commented on the #{@comment.board.title} board in #{@comment.board.project.title}!")
	end

	def notify_project_comment(user, comment)
		@user = user
		@comment = comment
		mail(to: 'd.timothy.freeman@gmail.com', subject: "#{@comment.user.full_name} just commented on your #{@comment.project.title} project!")
	end

end
