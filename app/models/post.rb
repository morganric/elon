class Post < ActiveRecord::Base

belongs_to :user

 mount_uploader :image, ImageUploader
  mount_uploader :audio, AudioUploader

 acts_as_taggable
end
