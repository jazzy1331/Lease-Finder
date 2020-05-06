class AddStudentIdToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :student, foreign_key: true
  end
end
