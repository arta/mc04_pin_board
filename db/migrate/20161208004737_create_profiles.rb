class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :username
      t.string :name
      t.date :dob
      t.string :location
      t.text :hobbies
      t.string :profession

      t.timestamps
    end
  end
end
