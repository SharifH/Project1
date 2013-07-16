class Winning < ActiveRecord::Base
  attr_accessible :user_id, :prize_id

  belongs_to :user
  belongs_to :prize

end