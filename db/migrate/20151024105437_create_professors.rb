class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.references :university, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
