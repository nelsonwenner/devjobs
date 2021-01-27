class Career < ApplicationRecord
  has_many :position, dependent: :destroy

  validates_presence_of :name, on: :create
end
