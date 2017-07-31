class Carlisting < ApplicationRecord
	belongs_to :area
	belongs_to :carmodel
	belongs_to :cartype
	belongs_to :user
	has_attached_file :photo_one, styles: { medium: "900x600>"},:convert_options => {:medium => "-resize 900x600^ \ -gravity center -extent 900x600" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_one, content_type: /\Aimage\/.*\z/
  has_attached_file :photo_two, styles: { medium: "600x600>"},:convert_options => {:medium => "-resize 600x600^ \ -gravity center -extent 600x600" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_two, content_type: /\Aimage\/.*\z/
  has_attached_file :photo_three, styles: { medium: "600x600>"},:convert_options => {:medium => "-resize 600x600^ \ -gravity center -extent 600x600" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_three, content_type: /\Aimage\/.*\z/
end
