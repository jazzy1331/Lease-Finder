#Edited by Lang Xu 4/19/2020, added password_digest column to students
class AddPasswordDigestToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :password_digest, :string
  end
end
