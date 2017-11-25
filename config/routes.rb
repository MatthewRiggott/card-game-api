Rails.application.routes.draw do
  resources :games
  get "games_index" => 'games#index_stream'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
