Rails.application.routes.draw do
  root 'pages#hello'
  get 'pages/hello'
  resources :categories do
    resources :purchases, only: [:new, :create]
  end
  resources :purchases, except: [:new, :show, :index]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
