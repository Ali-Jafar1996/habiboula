class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :role_id
      t.integer :idea_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
