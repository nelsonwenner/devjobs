class PositionSerializer < ActiveModel::Serializer
  
  attributes :slug, :name, :contract, :remote, :country, 
            :state, :city, :summary, :description, :publish
            
  belongs_to :company
  belongs_to :career
end
