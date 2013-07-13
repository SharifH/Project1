class Prize < ActiveRecord::Base
  attr_accessible :name, :expiry, :contest_id
  has_and_belongs_to_many :users
  belongs_to :contest
end
