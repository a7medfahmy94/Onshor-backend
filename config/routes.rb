Rails.application.routes.draw do
  apipie
  resources :posts, except: [:new, :edit]
  resources :users, except: [:new, :edit, :create]
end
