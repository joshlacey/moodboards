class Board < ApplicationRecord
	belongs_to :project
	has_many :images
	has_many :comments

	validates :title, presence: true
	
end
