class AddUniversityIdToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :university_id, :integer
  end
end
