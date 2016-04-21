class Job < ActiveRecord::Base
	belongs_to :idea
	belongs_to :role
	belongs_to :user

	validates :role_id, presence: true
	validates :idea_id, presence: true
	validates :user_id, presence: true

	scope :empty_jobs, -> {where(filled: false)}
end
