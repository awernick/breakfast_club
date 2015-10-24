class CreateStudyGroups < ActiveRecord::Migration
  def change
    create_table :study_groups do |t|
      t.string :name
      t.string :course_id
      t.integer :location_id
      t.text :description
      t.integer :professor_id

      t.timestamps null: false
    end
  end
end
