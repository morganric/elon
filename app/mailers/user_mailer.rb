class UserMailer < ActionMailer::Base
  default from: 'beta@elon.xyz'

  def welcome_email(user)
    @user = user
    @url  = 'http://embedtree.com/login'
    mail(to: @user.email, subject: 'Welcome to EmbedTree')
  end

  

  def admin_email(uploader, admin, post)
    @uploader = uploader
    @post = post
    @admin = admin
    @title = post.title
    @url  = user_post_url(:id => @post.slug, :user_id => @post.user.profile.slug)
    mail(to: @admin.email, subject: 'New EmbedTree Upload (Admin)')
  end 
end