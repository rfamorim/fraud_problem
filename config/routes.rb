Rails.application.routes.draw do
  get 'home' => 'static_pages#home', as: :home

  resources :collisions, only: [:new, :create]
  resources :collisions_files, only: [:new, :create]
  resources :nodes, only: [:index]

  root to: 'static_pages#home'
end
