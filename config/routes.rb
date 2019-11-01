Rails.application.routes.draw do
  devise_for :users 
  root to: 'pages#home'
  get '/users/sign_out' => 'devise/sessions#destroy'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
