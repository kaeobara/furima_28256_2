Rails.application.routes.draw do
  devise_for :users
  root "items#index"
<<<<<<< HEAD
  resources :items do
    resources :transactions, only: :index
  end
=======
  resources :items
  resources :users

>>>>>>> parent of c463fb9... payidを使えるようにする
end
