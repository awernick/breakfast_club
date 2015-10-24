class RemoveUnusedFields < ActiveRecord::Migration
  def up
    remove_column :professors, :university_id    
    remove_column :study_groups, :location_id
  end

  def down
    add_column :professors, :university_id, :integer
    add_column :study_groups, :location_id, :integer
  end
end
