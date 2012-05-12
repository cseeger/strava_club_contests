class Ride < ActiveRecord::Base
  belongs_to :athlete
  attr_accessible :elevation_gain
end
