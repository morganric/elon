class Post < ActiveRecord::Base

paginates_per 5
belongs_to :user

 mount_uploader :image, ImageUploader
  mount_uploader :audio, AudioUploader
  # has_attachment  :audio, accept: [:mp3, :wav]

 acts_as_taggable

 validates_presence_of :url	

 extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :listens
  has_many :listeners, :through => :listens

end
