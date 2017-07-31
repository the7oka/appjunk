class Carbrand < ApplicationRecord
	has_many :carmodels
	has_many :carmodels_by_name, -> { order(:name) }, class_name: 'Carmodel'
	has_attached_file :photo, styles: { medium: "300x300>"},:convert_options => {:medium => "-resize 300x300^ \ -gravity center -extent 300x300" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
