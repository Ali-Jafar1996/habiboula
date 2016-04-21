class Idea < ActiveRecord::Base
	serialize :role

	belongs_to :platform
	belongs_to :user
	belongs_to :job
	has_many :jobs

	validates :name, presence: true
	validates :description, presence: true
	validates :skills, presence: true
	validates :add_information, presence: true
	validates :user_id, presence: true
	validates :platform_id, presence: true
end
