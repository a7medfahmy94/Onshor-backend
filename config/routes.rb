Rails.application.routes.draw do
  apipie
  resources :posts, except: [:new, :edit] do
    member do
      post :share
    end
  end
  resources :users, only: [:show, :update, :destroy] do
    collection do

      post ':user_one/block/:user_two' => "users#block"
    end

  end
end
