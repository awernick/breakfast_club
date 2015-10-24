class AddProfessorIdToStudyGroups < ActiveRecord::Migration
  def change
    add_column :study_groups, :professor_id, :integer
  end
end
