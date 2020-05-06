#Edited by Lang Xu 4/19/2020, added password_digest column to landlords
class AddPasswordDigestToLandlords < ActiveRecord::Migration[5.2]
  def change
    add_column :landlords, :password_digest, :string
  end
end
