Rails.application.routes.draw do

   devise_for :users
  resources :users

    get 'submit', :to => "posts#submit", as: :submit
    get 'upload', :to => "posts#new", as: :upload
    get '/posts/admin' => 'posts#admin', as: :posts_admin
  
  get '/:user_id/:id/player', :to => "posts#player", as: :player
  get '/:user_id/:id/embed', :to => "posts#embed", as: :embed
  get 'tagged/:tag', :to => "posts#tag", as: :tag
  get 'featured', :to => "posts#featured", as: :featured
  get '/posts/:id/play' => 'posts#plays', as: :post_play
 
   get '/:user_id/:id' => 'posts#show', as: :user_post


   scope ":id" do
    
    get '/', to: 'profiles#show', as: :vanity_profile

  end


  resources :profiles
  resources :posts

  
  mount Upmin::Engine => '/admin'
  mount Attachinary::Engine => "/attachinary"

  
   root to: 'posts#index'

 





end
