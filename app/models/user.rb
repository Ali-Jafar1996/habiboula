class User < ActiveRecord::Base
	belongs_to :role
	has_many :ideas
	has_many :jobs

	VALID_USERNAME_REGEX = /[a-z]+/i
	validates :username, presence: true, length: { maximum: 50 },
						 format: { with: VALID_USERNAME_REGEX },
						 uniqueness: { case_sensitive: false }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i					 
	validates :email, presence: true, length: { maximum: 255 },
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }

	before_save { self.username = username.downcase}
	before_save { self.email = email.downcase}
					  
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
	
	validates :role_id, presence: true
	validates :admin, default: false
end
