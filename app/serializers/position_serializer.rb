class PositionSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :contract, :remote, :country, 
            :state, :city, :summary, :description, :publish,
            :company_id, :career_id

end
