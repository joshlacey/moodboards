class Project < ApplicationRecord
	has_many :user_projects
	has_many :users, through: :user_projects
	has_many :boards
	has_many :comments
	has_many :images, through: :boards

	before_save :clean_users

	def clean_users
		users.reject {|user| user.blank?}
	end

end
