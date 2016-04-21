Rails.application.routes.draw do
  resources :ideas
  resources :user_ideas
  resources :platforms
  resources :roles
  resources :jobs
  resources :users do
      get :make_admin, on: :member
  end
  root to: 'visitors#index'

  get 'sessions/new' => 'sessions#new', as: :login
  post 'sessions/new' => 'sessions#create'
  delete 'visitors/index' => 'sessions#destroy', as: :logout
  get 'users/new' => 'users#new', as: :signup
  get 'Login' => 'sessions#create'

  get 'jobs/:id/apply' => "jobs#apply", as: :apply
end
