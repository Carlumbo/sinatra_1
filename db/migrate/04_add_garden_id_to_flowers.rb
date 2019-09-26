class AddGardenIdToFlowers < ActiveRecord::Migration
  def change
    add_column :flowers, :flower_garden_id, :integer
  end
end
