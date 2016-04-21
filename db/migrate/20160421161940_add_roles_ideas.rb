class AddRolesIdeas < ActiveRecord::Migration
  def change
  	add_column :ideas, :role, :text
  end
end
