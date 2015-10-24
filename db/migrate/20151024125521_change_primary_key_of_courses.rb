class ChangePrimaryKeyOfCourses < ActiveRecord::Migration
  def up
    drop_table :courses
    create_table :courses do |t|
      t.string :name
      t.string :uid
      t.integer :university_id
      t.integer :professor_id

      t.timestamps null: false
    end
  end

  def down
  end
end
