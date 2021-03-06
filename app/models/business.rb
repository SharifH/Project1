class Business < ActiveRecord::Base
   attr_accessible :name, :type, :yelp_id, :user_id, :address1, :address2, :zip, :bartender_attributes
   has_many :followers
   has_many :users, :through => :followers
   has_many :bartenders, :class_name => 'User', :foreign_key => 'business_id'

   validates_presence_of  :address1,  :zip
   accepts_nested_attributes_for :followers, :allow_destroy => true
   accepts_nested_attributes_for :bartenders, :allow_destroy => true

   def self.dbEmpty
    return true if self.all == []
   end


end
