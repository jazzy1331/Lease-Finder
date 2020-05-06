#Created 4/7/20 by Jas Bawa
class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.string :phone
      t.date :dob

      t.timestamps
    end
  end
end
