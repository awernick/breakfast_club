class RemoveProfessorIdFromStudyGroups < ActiveRecord::Migration
  def change
    remove_column :study_groups, :professor_id
  end
end
