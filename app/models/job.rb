class Job < ActiveRecord::Base
	belongs_to :idea
	belongs_to :role
	belongs_to :user

	validates :role_id, presence: true
	validates :idea_id, presence: true
	validates :user_id, presence: true

	scope :empty_jobs, -> {where(filled: false)}
	scope :idea_name_asc, -> {order('job.idea.name ASC')} ##########
	scope :idea_name_desc, -> {order('job.idea.name DESC')} ##########
	scope :new_order, -> {order('job.created_at DESC')} ##########
	scope :old_order, -> {order('job.create_at ASC')} ##########
end
