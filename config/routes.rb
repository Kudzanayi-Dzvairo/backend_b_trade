Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
  resources :user_books
  resources :books
  resources :users, only: [:create]
     post'/login', to: 'auth#create'
     get '/profile', to: 'users#profile'
     get '/current_user', to: 'auth#show'
     post '/user_book', to: 'user_books#create'
    end
  end
end
