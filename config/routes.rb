Rails.application.routes.draw do
  resources :profiles
  resources :posts
  mount Upmin::Engine => '/admin'
  root to: 'posts#index'
  devise_for :users
  resources :users

  get 'posts/:id/embed', :to => "posts#embed", as: :embed
end
