Rails.application.routes.draw do
  root 'quotes#random'
  get '/quotes/random', to: 'quotes#random'
  put '/quotes/update_cheesy_score/', to: 'quotes#score_quotes_along_cheesiness_scale'

  resources :quotes do
    collection { get :search }
  end

  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
