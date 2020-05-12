Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :favorites
      resources :items
      resources :messages
    end
  end
  post '/login', to: 'auth#create'
  get '/current_user', to: 'auth#show'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
