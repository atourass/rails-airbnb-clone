Rails.application.routes.draw do
  devise_for :users
  root to: 'vehicles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vehicles, except: :destroy do
    member do
      resources :bookings, only: :index
    end
  end

  resources :bookings, except: [:index, :destroy]

  resources :dashboards, only: :index

end
