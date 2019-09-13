class AddGardenerIdToFlowerGardens < ActiveRecord::Migration
  def change
    add_column :flower_gardens, :user_id, :integer
  end
end
