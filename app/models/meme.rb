class Meme < ApplicationRecord
	acts_as_votable
	belongs_to :user
	has_many :memecomments
	has_attached_file :photo, styles: { medium: "600x300>"},:convert_options => {:medium => "-resize 600x300^ \ -gravity center -extent 600x300" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
