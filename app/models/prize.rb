class Prize < ActiveRecord::Base
  attr_accessible :name, :expiry, :contest_id

  has_many :winnings
  has_many :users, :through => :winnings

  belongs_to :contest
end
