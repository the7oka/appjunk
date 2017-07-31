class User < ApplicationRecord
	has_many :offers
	has_many :carlistings
	has_many :messages
	has_many :memes
	has_many :memecomments
	has_many :queries
	has_many :explanations
	has_many :posts
	has_many :postcomments
	has_friendship
	has_many :tasks
	has_many :definitions
	has_many :secrets
	has_many :wallmessages
	has_many :tweetamela5ers
	has_many :tweetacomments
	has_many :contactmes
	has_many :complaints
	has_many :complaintcomments
	has_many :videocomments
	acts_as_voter
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },:convert_options => {:medium => "-resize 300x300^ \ -gravity center -extent 300x300" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter, :facebook]
         validates_presence_of :username
  		 validates_uniqueness_of :username
  	def self.from_omniauth(auth)
	  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    	if auth.provider == "facebook"
		  		user.username = auth.info.email
		  		user.first_name = auth.info.first_name
		  		user.last_name = auth.info.last_name
			  	user.image = auth.info.image
			    user.email = auth.info.email
			    user.gender = auth.extra.raw_info.gender
			    user.birthday = auth.extra.raw_info.birthday
			    user.about = auth.extra.raw_info.about
			    user.display_name = auth.info.first_name
			    uri = URI.parse(auth.info.image)
				uri.scheme = 'https'
				user.avatar = URI.parse(uri.to_s)
	  		else 
			    user.username = auth.info.nickname
		  		user.first_name = auth.info.name
		  		user.last_name = auth.info.last_name
			  	user.image = auth.info.image
			    user.email = ""
			    user.gender = auth.info.gender
			    user.birthday = auth.info.birthday
			    user.about = auth.info.description
			    user.display_name = auth.info.nickname
			    user.avatar = URI.parse(auth.info.image)
	  		end
	  	end
	end
	GENDER_TYPES = ["Male", "Female"]
  	def password_required?
  		super && provider.blank?
	end
	def email_required?
  		super && provider.blank?
	end
end
