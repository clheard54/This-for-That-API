Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :favorites
      resources :items
      resources :messages
    post '/login', to: 'auth#create'
    get '/current_user', to: 'auth#show'
    post '/signup', to: 'users#create'
    get '/profile', to: 'users#show'
    get '*path', to: "application#fallback_index_html", constraints: ->(request) do
      !request.xhr? && request.format.html?
     end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
