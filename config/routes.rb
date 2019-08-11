Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  devise_for :users
	get 'signin_google','signin_linkedin','signin_facebook', to: 'oauth#redirect_to_provider'
  get 'users/auth/:provider/callback', to: 'oauth#callback_controller'
  get 'users/auth/failure' => 'oauth#failure'
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
