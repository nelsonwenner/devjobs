class User < ApplicationRecord
  has_secure_password
  
  validates_presence_of :username, :email, :password on: :create
  validates_uniqueness_of :email
  
end
