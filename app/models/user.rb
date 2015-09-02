class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create :create_profile
  validates :name, presence: true
  validates :name, uniqueness: true

  def set_default_role
    self.role ||= :user
  end

  def create_profile
    @profile = Profile.new(:user_id => id)
    @profile.save
  end

  has_many :posts
  has_one :profile

  has_many :listens
 has_many :listened_tos, :through => :listens, :source => :post


  has_many :user_favs
  has_many :favourites, :through => :user_favs, :source => :post


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
