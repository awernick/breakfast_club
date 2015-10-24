class AddDefaultToActiveInStudyGroups < ActiveRecord::Migration
  def change
    remove_column :study_groups, :active
    add_column :study_groups, :active, :boolean, null: false, default: true
  end
end
