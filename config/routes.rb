Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  get 'post/new' => 'match#new_post_form'
  post 'post/new' => 'match#new_post'
  get 'profile/:username' => 'profile#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
