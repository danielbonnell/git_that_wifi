Rails.application.routes.draw do
  resources :sites do
    resources :reviews do
      resources :votes, only: [:create, :update, :destroy, :index]
    end
  end

  root "sites#index"
    devise_for :users, controllers: { registrations: "registrations" }
    resources :users, only: [:show, :edit, :put]
end
