class Query < ApplicationRecord
	belongs_to :querycategory
	acts_as_votable
	belongs_to :user
	has_many :explanations
end
