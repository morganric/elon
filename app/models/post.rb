class Post < ActiveRecord::Base

belongs_to :user

 mount_uploader :image, ImageUploader
  mount_uploader :audio, AudioUploader
  # has_attachment  :audio, accept: [:mp3, :wav]

 acts_as_taggable

 validates_presence_of :url	
end
