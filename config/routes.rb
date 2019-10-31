Rails.application.routes.draw do
  devise_for :users 
  authenticated :user do
    root to: 'pages#home', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
  get '/users/sign_out' => 'devise/sessions#destroy'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
