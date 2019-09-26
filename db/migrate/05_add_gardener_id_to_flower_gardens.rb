class AddGardenerIdToFlowerGardens < ActiveRecord::Migration
  def change
    add_column :flower_gardens, :gardener_id, :integer
  end
end
