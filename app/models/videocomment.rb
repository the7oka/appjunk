class Videocomment < ApplicationRecord
	acts_as_votable
	belongs_to :video
	belongs_to :user
end
