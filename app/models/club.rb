class Club < ActiveRecord::Base
  has_many :athletes
  has_one :leaderboard
  attr_accessible :description, :name
end
