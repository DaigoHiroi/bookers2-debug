Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  # devise_for :users, controllers: {
  #   sessions: 'devise/sessions',
  #   registrations: 'devise/registrations'
  # }
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only:[:new, :create, :index, :show, :destroy,:edit,:update] do
	   resource :favorites, only: [:create, :destroy]
	   resource :book_comments, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
