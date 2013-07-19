class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  attr_accessible :name, :twitter, :business_id, :contest_id, :prize_id, :bartender, :business_attributes
  attr_accessible :tweet_id, :screen_name, :content


  #before_save :delete_bar_association
  has_many :followers
  has_many :businesses, :through => :followers
  belongs_to :bar, :class_name => "Business", :foreign_key => 'business_id'

  has_many :winnings
  has_many :prizes, :through => :winnings

  has_many :participations
  has_many :contests, :through => :participations

  has_one :timeline_id

  accepts_nested_attributes_for :businesses

  validate :no_adminbar

  # validate :already_chosen


   def self.from_omniauth(auth)
     where(auth.slice(:provider, :uid)).first_or_create do |user|
         user.provider = auth.provider
         user.uid = auth.uid
         user.username = auth.info.nickname
         user.oauth_token = auth["credentials"]["token"]
         user.oauth_secret = auth["credentials"]["secret"]
         user.save!
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

   def email_required?
     super && provider.blank?
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

   def no_adminbar
    if self.admin && self.bartender
      self.bartender = false
      errors.add(:bartender, "Can't be an admin and bartender")
    end
  end

  def pull_tweets
     Twitter.user_timeline("#{self.username}", :count => 50)
  end

  def follow(x)
     username = User.find(x).username
     Twitter.follow(username)
   end

  # def delete_bar_association
  #   if self.bartender == false
  #     self.business_id = nil
  #   end
  # end

  # def self.from_omniauth(auth)
  #   user = where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  #   user.oauth_token = auth["credentials"]["token"]
  #   user.oauth_secret = auth["credentials"]["secret"]
  #   user.save!
  #   user
  # end

  def twitter
    if provider == "twitter"
      @twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
    end
  end


end
