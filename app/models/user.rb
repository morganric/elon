class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
    def create_profile
    @profile = Profile.new(:user_id => id)
    @profile.save
  end

  def set_default_role
    self.role ||= :user
  end

    def create_profile
    @profile = Profile.new(:user_id => id)
    @profile.save
  end

  has_many :posts
  has_one :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
