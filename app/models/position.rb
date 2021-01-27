class Position < ApplicationRecord
  belongs_to :company
  belongs_to :career
  has_many :applicant, dependent: :destroy

  validates_presence_of :name, :contract, :remote, :country, :state, 
                        :city, :summary, :description, :publish, on: :create

end
