class CreateGardeners < ActiveRecord::Migration
  def change
    create_table :gardeners do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
