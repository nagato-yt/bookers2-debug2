Rails.application.routes.draw do
  get 'groups/create'
  get 'groups/destroy'
  get 'groups/update'
  get 'groups/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  
  get '/search', to: 'searches#search'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
  resource :favorites, only: [:create,:destroy]
  resources :book_comments, only: [:create,:destroy]
  
end 
  resources :users, only: [:index,:show,:edit,:update] do
    get "search", to: "users#search"
  resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :groups do
    get "join" => "groups#join"
    
     resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end 
    
  resources :chats, only: [:show, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 
