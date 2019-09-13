class CreateFlowerGardens < ActiveRecord::Migration
  def change
    create_table :flower_gardens do |t|
      t.string :name
      t.integer :size
    end
  end
end
