class PositionSerializer < ActiveModel::Serializer
  
  attributes :slug, :name, :career, :contract, :remote, :country, 
            :state, :city, :summary, :description, :publish
            
  belongs_to :company
end
