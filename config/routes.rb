Rails.application.routes.draw do
  root 'pages#index'
  
  namespace :api do
    namespace :v1 do
      resources :auths, only: %i[create] do
        collection do
          get 'me', to: 'auths#logged_in'
          delete 'logout', to: 'auths#logout'
        end
      end
    end
  end

  get '*path', to: 'pages#index', via: :all
end
