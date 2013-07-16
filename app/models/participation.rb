class Participation < ActiveRecord::Base
  attr_accessible :user_id, :contest_id

  belongs_to :user
  belongs_to :contest

end