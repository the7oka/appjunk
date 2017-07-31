class Complaint < ApplicationRecord
acts_as_votable
	belongs_to :user
	belongs_to :company
	has_many :complaintcomments
	has_attached_file :photo_one, styles: { long: "600x1200>", square: "1200x1200>",medium: "600x600>"},:convert_options => {:long => "-resize 600x1200^ \ -gravity center -extent 600x1200", :square => "-resize 1200x1200^ \ -gravity center -extent 1200x1200",:medium => "-resize 600x600^ \ -gravity center -extent 600x600" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_one, content_type: /\Aimage\/.*\z/
  has_attached_file :photo_two, styles: { medium: "600x600>", long: "600x1200>" },:convert_options => {:long => "-resize 600x1200^ \ -gravity center -extent 600x1200",:medium => "-resize 600x600^ \ -gravity center -extent 600x600" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_two, content_type: /\Aimage\/.*\z/
  has_attached_file :photo_three, styles: { medium: "600x600>"},:convert_options => {:medium => "-resize 600x600^ \ -gravity center -extent 600x600" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_three, content_type: /\Aimage\/.*\z/

end
