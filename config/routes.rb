Rails.application.routes.draw do
  root to: "restaurants#index"
  devise_for :owners
  resources :restaurants do
    resources :reservations
  end

  get 'dashboard', to: 'dashboards#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
