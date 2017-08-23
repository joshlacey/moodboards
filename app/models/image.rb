class Image < ApplicationRecord
	belongs_to :board
	belongs_to :user
	has_many :comments
	has_attached_file :image

end
