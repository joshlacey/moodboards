class User < ApplicationRecord
	has_many :user_projects
	has_many :projects, through: :user_projects
	has_many :comments
	has_many :images
	
	has_secure_password

end
