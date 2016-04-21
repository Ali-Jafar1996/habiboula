class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.text :skills
      t.text :add_information
      t.integer :user_id
      t.integer :platform_id

      t.timestamps null: false
    end
  end
end
