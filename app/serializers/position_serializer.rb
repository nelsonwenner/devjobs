class PositionSerializer < ActiveModel::Serializer
  
  attributes :name, :contract, :remote, :country, 
            :state, :city, :summary, :description, :publish,
            :company_id, :career_id

end
