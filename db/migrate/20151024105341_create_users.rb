class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email
      t.references :university, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
