Rails.application.routes.draw do
  resources :games
  
  get "streams_lobby" => 'streams#lobby'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
