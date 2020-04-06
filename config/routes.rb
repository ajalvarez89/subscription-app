Rails.application.routes.draw do
  get 'users/info', to: 'users#info'
  post 'users/charge', to: 'users#charge'
  get '/users/cancel_subscription', to: 'users#cancel_subscription'


  devise_for :users
  root to: "home#index"

  resources :publications, only: %i[index show]
  namespace :admin do
    resources :publications
  end
end
