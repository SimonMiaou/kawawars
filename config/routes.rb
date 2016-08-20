Rails.application.routes.draw do
  resources :hexagons, only: [:index, :create]
end
