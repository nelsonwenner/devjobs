class Company < ApplicationRecord
  belongs_to :user
  has_many :position, dependent: :destroy

  has_one_attached :brand
  
  validates_presence_of :name, :url, on: :create
  validates_presence_of :name, :url, on: :update

  before_save :empty_brand
  
  private

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
