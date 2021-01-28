class Position < ApplicationRecord
  belongs_to :company
  belongs_to :career
  has_many :applicant, dependent: :destroy

  validates_presence_of :name, :contract, :country, :state, :city, 
                        :summary, :description, on: :create
                        
  before_create :add_slug

  private

  def add_slug
    self.slug = self.name.parameterize
  end
end
