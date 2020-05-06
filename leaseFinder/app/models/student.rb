#Edited by Daniel Lim on 4/16/20: Added valid email regex and uniqueness and length
#Edited by Lang Xu on 4/19/2020: added secure password feature for students
#Edited by Daniel Lim on 4/21/20: Added uniqueness

class Student < ApplicationRecord
  has_many :sublet_posts, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  has_secure_password
	validates :password, :presence => true,  uniqueness: true, length: { minimum: 2 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :fname, :presence => true
  validates :lname, :presence => true
  validates :email, :presence => true, format: { with: VALID_EMAIL_REGEX },  uniqueness: true
  validates :phone, :presence => true, length: { minimum: 10 }
  validates :dob, :presence => true

end
