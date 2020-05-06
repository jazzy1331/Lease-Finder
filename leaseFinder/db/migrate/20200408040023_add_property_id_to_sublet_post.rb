#Edited by Lang Xu 2020/4/16, added foreign key reference to the property id in sublet post
class AddPropertyIdToSubletPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :sublet_posts,:property,foreign_key:true
  end
end
