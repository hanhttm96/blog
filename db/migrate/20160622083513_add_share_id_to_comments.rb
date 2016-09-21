class AddShareIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :share_id, :integer
  end
end
