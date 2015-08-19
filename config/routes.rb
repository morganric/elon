Rails.application.routes.draw do

  get '/:id' => 'profiles#show', as: :vanity_profile

  
  get 'posts/:id/player', :to => "posts#player", as: :player
  get 'posts/:id/embed', :to => "posts#embed", as: :embed
  get 'tagged/:tag', :to => "posts#tag", as: :tag
  get 'featured', :to => "posts#featured", as: :featured
  get '/posts/:id/play' => 'posts#plays', as: :post_play
 
   get '/:user_id/:id' => 'posts#show', as: :user_post

  get 'submit', :to => "posts#submit", as: :upload
    get '/posts/admin' => 'posts#admin', as: :posts_admin
  resources :profiles
  resources :posts

  
  mount Upmin::Engine => '/admin'
  mount Attachinary::Engine => "/attachinary"

  root to: 'posts#index'
  devise_for :users
  resources :users





end
