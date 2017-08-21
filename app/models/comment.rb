class Comment < ApplicationRecord
	belongs_to :image, optional: true
	belongs_to :board, optional: true
	belongs_to :project
	belongs_to :user

end
