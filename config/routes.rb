Rails.application.routes.draw do
  devise_for :admins

  get '/quotes/random', to: 'quotes#random'
  resources :quotes

  root 'quotes#random'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
