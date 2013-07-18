class Contest < ActiveRecord::Base
  attr_accessible :name, :description, :user_id, :prizes_attributes, :prize_ids, :prize_quantity
  before_save :delete_empty_prize
  has_many :participations
  has_many :users, :through => :participations
  has_many :prizes, :dependent => :destroy

  validates_presence_of :description
  validates_presence_of :name

  accepts_nested_attributes_for :prizes

  def delete_empty_prize
    self.prizes.delete_if { |prize|
       prize.id ==nil
    }
  end
end
