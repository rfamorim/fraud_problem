Rails.application.routes.draw do
  get 'nodes/index'

  resources :collisions, only: [:index, :new, :create]
  resources :collisions_files, only: [:new, :create]
end
