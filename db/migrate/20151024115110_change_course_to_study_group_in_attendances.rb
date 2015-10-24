class ChangeCourseToStudyGroupInAttendances < ActiveRecord::Migration
  def change
    remove_column :attendances, :course_id
    add_column :attendances, :study_group_id, :integer
  end
end
