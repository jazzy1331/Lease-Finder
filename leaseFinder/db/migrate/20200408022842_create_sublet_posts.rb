class CreateSubletPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :sublet_posts do |t|
      t.integer :housemates_num
      t.float :monthly_rent
      t.boolean :water_flag
      t.boolean :gas_flag
      t.boolean :electric_flag
      t.boolean :internet_flag
      t.boolean :other_util_flag
      t.date :start_date
      t.date :end_date
      t.integer :bedroom_num
      t.boolean :furnished_flag
      t.boolean :parking_flag
      t.text :house_rules
      t.boolean :taken
      t.text :description

      t.timestamps
    end
  end
end
