Rails.application.routes.draw do
  resources :standups, only: [:index]
end
