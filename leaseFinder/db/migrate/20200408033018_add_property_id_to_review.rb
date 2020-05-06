class AddPropertyIdToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :property, foreign_key: true
  end
end
