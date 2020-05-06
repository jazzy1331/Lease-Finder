class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :total_bedrooms
      t.integer :total_bathrooms
      t.boolean :pet_friendly

      t.timestamps
    end
  end
end
