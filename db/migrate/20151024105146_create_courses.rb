class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses, {:id => false} do |t|
      t.string :id
      t.integer :university_id

      t.timestamps null: false
    end
  end
end
