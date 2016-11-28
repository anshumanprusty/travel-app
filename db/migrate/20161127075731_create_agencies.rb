class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.integer :phone
      t.string :address

      t.timestamps null: false
    end
  end
end
