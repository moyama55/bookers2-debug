Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  root 'homes#top'
  get 'home/about' => 'homes#about',as:'about'
  resources :books do
    resources :book_comments,only: [:destroy, :create]
    resource :favorites,only: [:destroy, :create]
  end
end