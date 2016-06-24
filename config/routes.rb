Rails.application.routes.draw do
  apipie
  resources :posts, except: [:new, :edit] do
    member do
      post :share
      post :reply
    end
  end
  resources :users, only: [:show, :update, :destroy]
end
