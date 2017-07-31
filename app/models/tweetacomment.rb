class Tweetacomment < ApplicationRecord
	belongs_to :user
	belongs_to :tweetamela5er
	acts_as_votable
end
