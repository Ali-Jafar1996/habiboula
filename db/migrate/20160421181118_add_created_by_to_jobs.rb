class AddCreatedByToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :created_id, :integer
  end
end
