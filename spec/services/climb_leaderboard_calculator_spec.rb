require 'spec_helper'

describe ClimbLeaderboardCalculator do
  describe '.calculate_for_club' do
    it 'generates leaderboards based on club data' do
      club = FactoryGirl.create(:club)
      rides = double("rides", :count => 10, :empty? => false)
      athlete = double("athlete", :id => 1, :rides_for_month_year => rides, :name => 'Kevin Climber', :total_elevation_for_month_year => 1000, :average_elevation_per_ride_for_month_year => 100)
      club.stub(:athletes).and_return([athlete])
      ClimbLeaderboardCalculator.stub(:elevation_gain).and_return(1000)
      ClimbLeaderboardCalculator.stub(:average_elevation).and_return(100)

      ClimbLeaderboardCalculator.calculate_for_club(club)
      leaderboard = club.leaderboard
      first_place = leaderboard.leaderboard_line_items.first
      first_place.athlete_name.should == 'Kevin Climber'
      first_place.athlete_strava_id.should == 1
      first_place.elevation_gain.should == 1000
      first_place.average_elevation.should == 100
      first_place.number_of_rides.should == 10
    end
  end
end
