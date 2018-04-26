Rails.application.routes.draw do

  root 'static_pages#index'
  get '/about',to:'static_pages#about'
  get '/sign',to:'users#new'
  post '/sign',to:'users#create'
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'
  get '/admin/login', to:'admin/sessions#new'
  post '/admin/login',to:'admin/sessions#create'
  delete '/admin/logout',to:'admin/sessions#destroy'
  
  resources :users, only: [:new,:create,:show]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new,:create,:edit,:update]
  resources :posts, only: [:index,:show]
  resources :comments, only: [:create]
  resources :messages, only: [:create]
  match 'posts_vote', to: 'static_pages#posts_vote', via: :get

  namespace :admin do
    resources :dashboards ,only: :index
    resources :administrators,only: [:index,:edit,:update,:new,:create]
    resources :users,only: [:index,:show,:update,:destroy]
    resources :posts,except: [:new,:edit]
    resources :tags, only: [:create,:destroy]
    resources :comments, only: [:index,:destroy]
    resources :messages, only: [:index,:destroy]

     match 'all_users_delete', to: 'admin/users#delete_all', via: :delete
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end