class Position < ApplicationRecord
  belongs_to :company
  belongs_to :career
  has_many :applicant, dependent: :destroy

  validates_presence_of :name, :contract, :country, :state, :city, 
                        :summary, :description, on: :create

end
