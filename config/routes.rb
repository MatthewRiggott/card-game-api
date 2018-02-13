Rails.application.routes.draw do
  resources :games
  
  get "streams_lobby" => 'streams#lobby'

  post "graphql" => "graphqls#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
end
