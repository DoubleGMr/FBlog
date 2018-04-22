Rails.application.routes.draw do
  
  namespace :admin do
    get 'dashboards/index'
  end

  namespace :admin do
    get 'administrators/new'
  end

  namespace :admin do
    get 'administrators/show'
  end

  namespace :admin do
    get 'administrators/edit'
  end

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
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new,:create,:edit,:update]

  namespace :admin do
    resources :dashboards ,only: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end