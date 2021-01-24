class CompanySerializer
  include FastJsonapi::ObjectSerializer
  attributes :slug, :name, :url, :brand
  
  has_many :position
end
