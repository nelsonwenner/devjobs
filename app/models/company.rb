class Company < ApplicationRecord
  belongs_to :user
  has_many :position, dependent: :destroy
  
  before_create :slugify
  
  def slugify
    self.slug = name.parameterize
  end

  validates_presence_of :name, :url, on: :create
end
