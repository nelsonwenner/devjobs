class Company < ApplicationRecord
  belongs_to :user
  has_many :position, dependent: :destroy
end
