class CreateCommentshares < ActiveRecord::Migration
  def change
    create_table :commentshares do |t|
      t.string :body
      t.integer :share_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
