class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position

  has_one_attached :curriculum
  
  validates_presence_of :name, :email, :phone
end
