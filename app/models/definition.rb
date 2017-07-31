class Definition < ApplicationRecord
	belongs_to :user
	belongs_to :word
	validates :word, presence: true
	acts_as_votable
end
