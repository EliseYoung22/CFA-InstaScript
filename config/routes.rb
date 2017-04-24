Rails.application.routes.draw do

  resources :medications
  devise_for :users
  root 'pages#home'

  get 'dashboard' => 'pages#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/buy/:slug', to: 'transactions#create', as: :buy
  get '/pickup/:uuid', to: 'transactions#pickup', as: :pickup

end
