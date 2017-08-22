class Project < ApplicationRecord
	has_many :user_projects
	has_many :users, through: :user_projects
	has_many :boards
	has_many :comments
	has_many :images, through: :boards


end
