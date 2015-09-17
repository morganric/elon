class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create :create_profile
  # after_create :add_invite


  # def add_invite
  #   @invitecode = Invite.find_by_name(:invite_code)
  #   @invitecode.used = @invitecode.used + 1
  #   @invitecode.save
  # end

  @codes = []

  # Code.all.each do |code|
  #   @codes << code.name
  # end


  validates_inclusion_of :invite_code, :in => @codes, 
    :message => "not a valid code." 
  validates :invite_code, uniqueness: false

  # validates_presence_of :name
  # validates :invite_code, uniqueness: false
 


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
