class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :email, on: :create
  validates_uniqueness_of :email
  
end
