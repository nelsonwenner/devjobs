class PositionSerializer < ActiveModel::Serializer
  
  attributes :name, :contract, :remote, :country, 
            :state, :city, :summary, :description, :publish
            
  belongs_to :company
  belongs_to :career
end
