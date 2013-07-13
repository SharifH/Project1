class Bartender < ActiveRecord::Base
  attr_accessible :name, :business_id, :twitter
  belongs_to :business
end
