class Position < ApplicationRecord
  belongs_to :company
  has_many :applicant, dependent: :destroy
end
