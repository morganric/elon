Rails.application.routes.draw do
  

  resources :codes
  resources :invitecodes
  post 'facebook' => 'posts#facebook', as: :post_facebook
  get 'facebook' => 'posts#facebook', as: :get_facebook

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
    get '/favourites', to: 'profiles#favourites', as: :vanity_favourites

  end

  get '/:user_id/:id' => 'posts#show', as: :user_post

    post 'user_favs' => 'user_favs#create', :as => 'user_favs'
  delete 'user_favs' => 'user_favs#destroy', :as => 'delete_user_favs'

  
  mount Upmin::Engine => '/admin'
  mount Attachinary::Engine => "/attachinary"

  
   root to: 'posts#index'

 





end
