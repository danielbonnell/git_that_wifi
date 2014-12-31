Rails.application.routes.draw do
  resources :sites
  root "sites#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:show, :edit, :put]
end
