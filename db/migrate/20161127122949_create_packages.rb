class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :price
      t.string :duration

      t.timestamps null: false
    end
  end
end
