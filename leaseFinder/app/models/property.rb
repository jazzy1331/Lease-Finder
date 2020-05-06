=begin
	
	Edited 4/20/2020 by Juhee Park: Added scope statement
	
=end
class Property < ApplicationRecord
	has_many :reviews, :dependent => :destroy
	has_many :sublet_posts, :dependent => :destroy
	belongs_to :landlord
	validates :address, :presence => true
	validates :total_bedrooms, :presence => true
	validates :total_bathrooms, :presence => true
	validates :pet_friendly, inclusion: { in: [true, false] }

	scope :pet_friendly, -> (pref) {where(pet_friendly: pref)}
end
