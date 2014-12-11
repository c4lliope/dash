Rails.application.routes.draw do
  root 'standups#index'
  resources :standups, only: [:index]
end
