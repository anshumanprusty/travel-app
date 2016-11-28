class AddColumnToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :agency_id, :integer
  end
end
