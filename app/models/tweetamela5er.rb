class Tweetamela5er < ApplicationRecord
	acts_as_votable
	belongs_to :user
	has_many :tweetacomments
end
