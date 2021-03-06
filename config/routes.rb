Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :companies, param: :id, only: [:create, :show, :update]
      resources :positions, param: :slug, only: [:create, :index, :show, :update]
      resources :applicants, only: [:create]
      resources :registrations, only: [:create]
      resources :auths, only: [:create] do
        collection do
          post 'password/forgot', to: 'auths#forgot_password'
          post 'password/reset', to: 'auths#reset_password'
          get 'me', to: 'auths#logged_in'
          delete 'logout', to: 'auths#logout'
        end
      end
    end
  end

  get '*path', to: 'pages#index', via: :all
end
