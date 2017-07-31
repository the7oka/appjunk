class Memecomment < ApplicationRecord
	acts_as_votable
	belongs_to :meme
	belongs_to :user
end
