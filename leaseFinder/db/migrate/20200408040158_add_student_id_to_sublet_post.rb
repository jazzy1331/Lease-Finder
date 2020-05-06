#Edited by Lang Xu 2020/4/16, added foreign key reference to the student id in sublet post
class AddStudentIdToSubletPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :sublet_posts,:student,foreign_key:true
  end
end
