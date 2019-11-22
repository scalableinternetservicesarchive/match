Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/home'
  get 'post/new' => 'match#new_post_form'
  post 'post/new' => 'match#new_post'
  get 'profile/:username' => 'profile#show'
  get 'schedule/add' => 'schedule#add_timeslot_form'
  post 'schedule/add' => 'schedule#add_timeslot'
  get 'search' => 'match#search'
  get 'interest/add' => 'player_interest_mapping#add_player_interest_mapping_form'
  post 'interest/add' => 'player_interest_mapping#add_player_interest_mapping'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
