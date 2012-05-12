class LeaderboardLineItem < ActiveRecord::Base
  belongs_to :leaderboard
  attr_accessible :average_elevation, :elevation_gain, :number_of_rides, :athlete_name
end
