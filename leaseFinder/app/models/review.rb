class Review < ApplicationRecord
	belongs_to :student
	belongs_to :property
	validates :review, :presence => true
	validates :stars, :presence => true

end
