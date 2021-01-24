class Company < ApplicationRecord
  belongs_to :user
  has_many :position, dependent: :destroy

  has_one_attached :brand
    
  validates_presence_of :name, :url, on: :create
  
  before_create :add_slug
  before_create :empty_brand
  
  private

  def add_slug
    self.slug = self.name.parameterize
  end
  
  def empty_brand
    self.brand.attach(
      io: File.open(
        Rails.root.join(
          'app', 'assets', 'images', 'company_default_logo.png'
        )
      ),
        filename: 'company_default_logo.png', 
        content_type: 'image/png'
    ) if brand.blank?
  end
end
