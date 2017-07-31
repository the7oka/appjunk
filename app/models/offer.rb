class Offer < ApplicationRecord
	acts_as_votable
	belongs_to :user
	belongs_to :offercategory
	has_many :offerrequests
	has_attached_file :photo, styles: { medium: "600x600>"},:convert_options => {:medium => "-resize 600x600^ \ -gravity center -extent 600x600" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
