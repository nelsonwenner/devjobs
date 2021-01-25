class CompanySerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :url, :brand
  
  attribute :brand do |object|
    if object.brand.attached?
      {
        url: Rails.application.routes.url_helpers.rails_blob_url(
          object.brand, disposition: "attachment", only_path: true
        )
      }
    end
  end
  
  has_many :position
end
