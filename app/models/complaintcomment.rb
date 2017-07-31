class Complaintcomment < ApplicationRecord
	belongs_to :user
	belongs_to :complaint
	acts_as_votable
end
