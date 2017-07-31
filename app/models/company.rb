class Company < ApplicationRecord
	has_many :complaints
	belongs_to :category
end
