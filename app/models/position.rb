class Position < ApplicationRecord
  belongs_to :company
  has_many :applicant, dependent: :destroy

  validates_presence_of :name, :career, :contract, :remote, :country, :state, :city, :summary, :description, :publish, on: :create
end
