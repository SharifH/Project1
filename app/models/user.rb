class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  attr_accessible :name, :twitter, :business_id, :contest_id, :prize_id, :bartender

  has_many :followers
  has_many :businesses, :through => :followers
  has_and_belongs_to_many :contests
  has_and_belongs_to_many :prizes

  # def self.from_omniauth(auth)
  #    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  #  end

   def self.from_omniauth(auth)
     where(auth.slice(:provider, :uid)).first_or_create do |user|
         user.provider = auth.provider
         user.uid = auth.uid
         user.username = auth.info.nickname
       end
   end

   def self.new_with_session(params, session)
     if session["devise.user_attributes"]
       new(session["devise.user_attributes"], without_protection: true) do |user|
         user.attributes = params
         user.valid?
       end
     else
       super
     end
   end

   def password_required?
     super && provider.blank?
   end

   def update_with_password(params, *options)
     if encrypted_password.blank?
       update_attributes(params, *options)
     else
       super
     end
   end
end
