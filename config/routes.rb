Rails.application.routes.draw do
  root "contacts#index"
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :kinds
  resources :contacts
end
