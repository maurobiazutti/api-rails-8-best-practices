require "api_constraints"

Rails.application.routes.draw do
  # root "contacts#index"
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for "User", at: "auth"

    # scope module: :v1,
    namespace :v1 do
      # constraints: ApiConstraints.new(version: 1, default: false) do
      resources :contacts,  shallow: true do
        resources :phones, shallow: true
        resources :addresses, shallow: true
      end
      resources :kinds
    end

    # scope module: :v2,
    namespace :v2 do
      # constraints: ApiConstraints.new(version: 2, default: true) do
      resources :contacts,  shallow: true do
        resources :phones, shallow: true
        resources :addresses, shallow: true
      end
      resources :kinds
    end
  end
end
