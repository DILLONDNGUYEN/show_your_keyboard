class User < ActiveRecord::Base
  has_secure_password
  has_many :images
  has_many :keycaps
  has_many :switches

  

end