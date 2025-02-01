Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :kinds
  resources :contacts
  get "up" => "rails/health#show", as: :rails_health_check

   root "contacts#index"
end
