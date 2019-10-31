Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
