Rails.application.routes.draw do
  resources :sites do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :reviews, only: [:show] do
    resources :votes, only: [:create, :update, :destroy]
  end

  root "sites#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:show, :edit, :put]
end
