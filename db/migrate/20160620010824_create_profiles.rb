class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :birthday
      t.string :sex
      t.string :address

      t.timestamps null: false
    end
  end
end
