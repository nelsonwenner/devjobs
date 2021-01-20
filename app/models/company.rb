class Company < ApplicationRecord
  belongs_to :user
  has_many :position, dependent: :destroy
  
  validates_presence_of :name, :url, on: :create
end
