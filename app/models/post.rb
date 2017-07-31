class Post < ApplicationRecord
	acts_as_votable
	has_many :postcomments
	belongs_to :user
	has_attached_file :photo_one, styles: {postsize: "1200x630>",thumb: "300x300>"},:convert_options => {:postsize => "-resize 1200x630^ \ -gravity center -extent 1200x630",:thumb => "-resize 300x300^ \ -gravity center -extent 300x300" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo_one, content_type: /\Aimage\/.*\z/
end
