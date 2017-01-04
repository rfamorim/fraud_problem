Rails.application.routes.draw do
  resources :nodes, only: [:index, :new, :create]
  resources :collisions_files, only: [:new, :create]
end
