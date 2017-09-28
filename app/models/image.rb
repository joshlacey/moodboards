class Image < ApplicationRecord
	belongs_to :board
	belongs_to :user
	has_many :comments
	#has_attached_file :photo, default_url: "/images/:style/missing.png"
	#validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
	#validates :url, :url => true, :allow_blank => true
	#validates_format_of :url, :with => /\.(jpe?g|png|gif|bmp)\z/i, :on => :create

def file_for
	if self.url?
		self.url
	elsif self.photo?
		self.photo
	else
		nil
	end
end


end
