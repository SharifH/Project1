class Prize < ActiveRecord::Base
  attr_accessible :name, :contest_id, :url

  has_many :winnings
  has_many :users, :through => :winnings

  belongs_to :contest
end
