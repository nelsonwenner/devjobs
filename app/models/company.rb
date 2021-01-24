class Company < ApplicationRecord
  belongs_to :user
  has_many :position, dependent: :destroy
  
  validates_presence_of :name, :url, on: :create
  
  before_create :add_slug
  before_create :empty_brand
  
  private

  def add_slug
    self.slug = self.name.parameterize
  end

  def empty_brand
    self.brand = 'company_default_logo.png' if brand.blank?
  end
end
