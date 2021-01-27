class CompanySerializer < ActiveModel::Serializer

  attributes :name, :url, :brand

  def brand
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
