Rails.application.routes.draw do


  get '/posts/admin' => 'posts#admin', as: :posts_admin

   devise_for :users
    resources :users
    
  resources :profiles
  resources :posts
    resources :listens

    get 'about', :to => "visitors#index", as: :about
    get 'submit', :to => "posts#submit", as: :submit
    get 'upload', :to => "posts#new", as: :upload
 
  
  get '/:user_id/:id/player', :to => "posts#player", as: :player
  get '/:user_id/:id/embed', :to => "posts#embed", as: :embed
  get 'tagged/:tag', :to => "posts#tag", as: :tag
  get 'featured', :to => "posts#featured", as: :featured
  get '/posts/:id/play' => 'posts#plays', as: :post_play
 


   scope ":id" do
    
    get '/', to: 'profiles#show', as: :vanity_profile
      get '/listens', to: 'profiles#listens', as: :vanity_listens

  end

  get '/:user_id/:id' => 'posts#show', as: :user_post



  
  mount Upmin::Engine => '/admin'
  mount Attachinary::Engine => "/attachinary"

  
   root to: 'posts#index'

 





end
