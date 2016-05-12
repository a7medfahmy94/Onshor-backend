Rails.application.routes.draw do
  apipie
  resources :posts, except: [:new, :edit]
  resources :users, only: [:show, :update, :destroy]
end
