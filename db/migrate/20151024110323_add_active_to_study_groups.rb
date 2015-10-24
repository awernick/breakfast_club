class AddActiveToStudyGroups < ActiveRecord::Migration
  def change
    add_column :study_groups, :active, :boolean
  end
end
