Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  get "search", to: "dreams#search"
  resources :dreams do
    resources :locations, only: [:create]
    resources :likes, only: [:create, :destroy]
    resources :meetings, only: [:new, :create]
  end
  resources :meetings, only: [:show, :index, :destroy]
  resources :chatrooms, only: [:show, :index, :new, :create] do
    resources :messages, only: [:create]
  end
end
