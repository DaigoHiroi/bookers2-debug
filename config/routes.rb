Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to:'users/sessions#guest_sign_in', as: 'guest_sign_in'
  end
  root :to => "homes#top"
  get "home/about" => "homes#about"
  get '/search', to: 'search#search'

  resources :books, only:[:new, :create, :index, :show, :destroy,:edit,:update] do
	   resource :favorites, only: [:create, :destroy]
	   resource :book_comments, only: [:create, :destroy]
  end
  resources :users do
    resources :chat_rooms, only: [:create, :show] do
      resource :chats, only: [:create]
    end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

end
