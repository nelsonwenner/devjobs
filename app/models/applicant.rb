class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position
  
  validates_presence_of :name, :email, :phone, on: :create
end
