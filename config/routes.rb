Rails.application.routes.draw do
  resources :profiles
  resources :posts
  mount Upmin::Engine => '/admin'
  mount Attachinary::Engine => "/attachinary"

  root to: 'posts#index'
  devise_for :users
  resources :users

  get 'posts/:id/embed', :to => "posts#embed", as: :embed
  get 'tagged/:tag', :to => "posts#tag", as: :tag
  get 'featured', :to => "posts#featured", as: :featured
  get '/posts/:id/play' => 'posts#plays', as: :post_play


end
