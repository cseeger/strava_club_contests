class Athlete < ActiveRecord::Base
  belongs_to :club
  has_many :rides
  has_and_belongs_to_many :leaderboards

  attr_accessible :name
end
