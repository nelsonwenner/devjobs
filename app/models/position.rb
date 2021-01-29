class Position < ApplicationRecord
  belongs_to :company
  has_many :applicant, dependent: :destroy

  enum career: [:developer, :business_intelligence, :information_technology,
                :design, :devops, :product, :other] 
  enum contract: [:clt, :pj, :match]

  validates_presence_of :name, :career, :contract, :country, :state, :city, 
                        :summary, :description

  before_save :add_slug

  private

  def add_slug
    self.slug = "#{self.company.name.parameterize}-#{self.name.parameterize}" 
  end
end
