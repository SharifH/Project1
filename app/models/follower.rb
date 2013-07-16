class Follower < ActiveRecord::Base
  attr_accessible :user_id, :business_id

  belongs_to :user
  belongs_to :business

  # before_save :set_follower_id

  # def set_follower_id
  #   self.follower_id = self.user_id
  # end

end
