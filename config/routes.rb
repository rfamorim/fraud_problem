Rails.application.routes.draw do
  resources :nodes, only: [:index, :new, :create]
end
