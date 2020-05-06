class CreateLandlords < ActiveRecord::Migration[5.2]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone
      t.string :website
      t.string :office

      t.timestamps
    end
  end
end
