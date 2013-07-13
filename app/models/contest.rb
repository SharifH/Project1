class Contest < ActiveRecord::Base
  attr_accessible :name, :prize_id, :user_id
  has_and_belongs_to_many :users
  has_many :prizes

end
