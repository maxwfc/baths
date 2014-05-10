Baths::Application.routes.draw do
  get "user_sessions/new"
  get "user_sessions/create"
  get "user_sessions/destroy"
  get "new/create"
  get "new/destroy"
  root :to => 'articles#index'
  resources :users
  resources :articles
  resources :user_sessions
  resources :uploads
  
  get 'archive' => 'articles#archive', :as => :archive
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  get "sign_up" => "users#new", :as => "sign_up"
end
