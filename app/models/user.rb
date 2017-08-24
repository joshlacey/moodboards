class User < ApplicationRecord
	has_many :user_projects
	has_many :projects, through: :user_projects
	has_many :comments
	has_many :images

	has_secure_password

	def full_name
		"#{self.first_name} #{self.last_name}"
	end

end
