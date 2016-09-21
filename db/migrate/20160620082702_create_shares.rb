class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :title
      t.string :descriptions
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
