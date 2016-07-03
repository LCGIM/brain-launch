class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :account

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
    :omniauth_providers => [:facebook]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]

      name = auth.info.name.split(" ")
      user.first_name = name[0]   # assuming the user model has a name
      user.last_name = name[1]   # assuming the user model has a name

      user.image = auth.info.image # assuming the user model has an image
    end
  end


end
