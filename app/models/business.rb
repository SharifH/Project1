class Business < ActiveRecord::Base
   attr_accessible :name, :type, :yelp_id, :user_id
   has_many :bartenders
   has_and_belongs_to_many :users

end
