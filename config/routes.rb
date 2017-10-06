Rails.application.routes.draw do
  root 'quotes#random'
  get '/quotes/random', to: 'quotes#random'

  resources :quotes do
    collection { get :search }
  end

  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
