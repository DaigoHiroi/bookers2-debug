Rails.application.routes.draw do
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get '/search', to: 'search#search'
  resources :books, only:[:new, :create, :index, :show, :destroy,:edit,:update] do
	   resource :favorites, only: [:create, :destroy]
	   resource :book_comments, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

end
