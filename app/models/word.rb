class Word < ApplicationRecord
has_many :definitions, :dependent => :delete_all
	validates :word, format: { with: /\p{Arabic}/u,
    message: "only allows arabic" }
    validates :word, format: { without: /\p{latin}/,
    message: "only allows arabic" }
end
