class Contest < ActiveRecord::Base
  attr_accessible :name, :prize_id, :user_id

  has_many :participations
  has_many :users, :through => :participations
  has_many :prizes

end
