Rails.application.routes.draw do
  get 'searches/search'
  get 'searches/searche'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  root 'homes#top'
  get 'home/about' => 'homes#about',as:'about'
  get '/search', to: 'searches#search'
  resources :books do
    resources :book_comments,only: [:destroy, :create]
    resource :favorites,only: [:destroy, :create]
  end
end