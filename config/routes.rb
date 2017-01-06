Rails.application.routes.draw do
  resources :collisions, only: [:new, :create]
  resources :collisions_files, only: [:new, :create]
  resources :nodes, only: [:index]

  get 'home' => 'static_pages#home', as: :home
  root to: 'static_pages#home'
end
