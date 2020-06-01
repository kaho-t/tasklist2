Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks
  
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  delete 'users', to: 'users#destroy'
  
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
end
