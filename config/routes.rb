Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/home' => 'pages#home'
  post 'pages/home' => 'pages#form_submission'
  get 'post/new' => 'match#new_post_form'
  post 'post/new' => 'match#new_post'
  get 'profile/:username' => 'profile#show'
  get 'schedule/add' => 'schedule#add_timeslot_form'
  post 'schedule/add' => 'schedule#add_timeslot'
  get 'search/games' => 'match#search_games'
  get 'search/users' => 'match#search_users'
  get 'interest/add' => 'player_interest_mapping#add_player_interest_mapping_form'
  post 'interest/add' => 'player_interest_mapping#add_player_interest_mapping'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
