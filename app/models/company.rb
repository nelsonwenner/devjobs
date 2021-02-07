class Company < ApplicationRecord
  belongs_to :user
  has_many :position, dependent: :destroy

  has_one_attached :brand
  
  validates_presence_of :name, :url, on: %i[create update]

  after_commit :add_default_brand, on: %i[create update]

  private

  def add_default_brand
    unless self.brand.attached?
      self.brand.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'company_default_logo.png'
          )
        ),
          filename: 'company_default_logo.png', 
          content_type: 'image/png'
      )
    end
  end
end
