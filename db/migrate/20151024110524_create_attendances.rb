class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.string :course_id

      t.timestamps null: false
    end
  end
end
