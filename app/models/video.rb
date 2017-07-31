class Video < ApplicationRecord
	acts_as_votable
	has_many :videocomments
	has_and_belongs_to_many :videocats
	has_attached_file :thumbnail, styles: { medium: "640x360>"},:convert_options => {:medium => "-resize 640x360^ \ -gravity center -extent 640x360" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/
end
