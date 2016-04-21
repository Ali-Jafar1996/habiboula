class Idea < ActiveRecord::Base
	belongs_to :platform
	belongs_to :user
	belongs_to :role ###########
	has_many :jobs

	validates :name, presence: true
	validates :description, presence: true
	validates :skills, presence: true
	validates :add_information, presence: true
	validates :user_id, presence: true
	validates :platform_id, presence: true
end
