Rails.application.routes.draw do

  resources :users

  delete '/logout', to: 'sessions#destroy'
end
