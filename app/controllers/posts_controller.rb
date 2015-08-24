class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :embed, :plays, :player  ]
  before_action :allow_iframe, only: :embed
  before_filter :authenticate_user!,  except: [:index, :show, :tag, :embed, :modal, :featured, :plays]
  before_action :admin_only, :only => :admin

  require 'embedly'
  require 'json'

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(:published => true).order('plays DESC').page params[:page]
  end

  def featured
    @posts = Post.where(:featured => true).order('created_at DESC')
  end

   def admin
    @posts = Post.where(:published => false).order('plays DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  
  end

  def plays

    @post.plays = @post.plays.to_i + 1
    @post.save

    respond_to do |format|
     if @post.save
       format.json { render :show, status: :ok, location: @post }
     else
       format.html { render action: 'new' }
       format.json { render json: @post.errors, status: :unprocessable_entity }
     end
   end

  end

  def embed
     render layout: 'embed'
  end

  def player
     render layout: 'embed'
  end


   def tag
    @tag = params[:tag]

    @posts = Post.tagged_with(@tag)    
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def submit
    @post = Post.new
  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id



    if post_params[:hidden] == "true"
    # embeddly  here
    embedly_api = Embedly::API.new :key => 'a2fb48b9541743e5af42f58f216a4f6d'
    obj = embedly_api.oembed :url => @post.url

    @post.plays = 0
    @post.title = obj[0].title
    @post.summary =  obj[0].description
    # @post.thumbnail = obj[0].thumbnail_url
    # @leaf.domain = obj[0].provider_name
    end
    @post.published = false

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def allow_iframe
    response.headers['X-Frame-Options'] = "ALLOWALL"
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :user_id, :body, :summary, :audio, 
        :image, :plays, :url, :published, :hidden, :slug, :tag_list, :featured)
    end
end
