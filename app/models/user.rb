class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :twitter, :business_id, :contest_id, :prize_id
  has_and_belongs_to_many :businesses

  has_and_belongs_to_many :contests
  has_and_belongs_to_many :prizes

  def self.from_omniauth(auth)
     where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
   end

   def self.create_from_omniauth(auth)
     create! do |user|
       user.provider = auth["provider"]
       user.uid = auth["uid"]
       user.name = auth["info"]["nickname"]
     end
   end
end
