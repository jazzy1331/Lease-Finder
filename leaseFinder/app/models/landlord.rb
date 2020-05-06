#Edited by Daniel Lim on 4/12/20: added validate, has_many and dependent
#Edited by Lang Xu on 4/19/2020: added secure password feature for landlords
class Landlord < ApplicationRecord
	has_many :properties, :dependent => :destroy
	validates :name, :presence => true
	validates :email, :presence => true
	has_secure_password
	validates :password, :presence => true
	validates :phone, :presence => true
end

