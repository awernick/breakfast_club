class AddCoordinatesToStudyGroups < ActiveRecord::Migration
  def change
    add_column :study_groups, :latitude, :decimal, {:precision=>10, :scale=>6}
    add_column :study_groups, :longitude, :decimal, {:precision => 10, :scale => 6}
  end
end
