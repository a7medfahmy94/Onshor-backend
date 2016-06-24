Rails.application.routes.draw do
  apipie
  resources :posts, except: [:new, :edit] do
    member do
      post :share
    end
  end
  resources :users, only: [:show, :update, :destroy]
end
