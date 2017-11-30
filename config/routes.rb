Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'

  get 'dashboard', to: 'dashboard#index'

  resources :bookings, only: [:show, :edit, :update] do
    member do
      patch 'cancel', to: 'bookings#cancel', as: 'cancel'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update, :create] do
    member do
      resources :bookings, only: [:index, :new, :create]
    end
  end



  mount Attachinary::Engine => "/attachinary"
end
