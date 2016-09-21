class AddTypeIdToShares < ActiveRecord::Migration
  def change
    add_column :shares, :type_id, :integer
  end
end
