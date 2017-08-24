class Image < ApplicationRecord
	belongs_to :board
	belongs_to :user
	has_many :comments
	has_attached_file :photo, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
	validates :url, :url => true, :allow_blank => true

def file_for
	if self.url?
		self.url
	elsif self.photo?
		self.photo
	end
end


end
