class Follower < ActiveRecord::Base
  attr_accessible :user_id, :business_id

  belongs_to :user
  belongs_to :business


end
