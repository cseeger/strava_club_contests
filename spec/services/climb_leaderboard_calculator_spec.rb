require 'spec_helper'

describe ClimbLeaderboardCalculator do
  describe '.calculate_for_club' do
    it 'generates leaderboards based on club data' do
      club = FactoryGirl.create(:club_with_athletes)
      ClimbLeaderboardCalculator.calculate_for_club(club)

      leaderboard = club.leaderboard
      first_place = leaderboard.leaderboard_line_items.first
      first_place.athlete_name.should == 'Kevin Climber'
      first_place.elevation_gain.should == 1000
      first_place.average_elevation.should == 100
      first_place.number_of_rides.should == 10
    end
  end
  describe '.elevation_gain' do
    it 'generates total elevation_gain for rider over the month/year' do
      athlete = FactoryGirl.create(:athlete_with_rides)
      ClimbLeaderboardCalculator.elevation_gain(athlete).should == 1000
    end
    it 'returns zero when the user has no rides' do
      athlete = FactoryGirl.create(:athlete)
      ClimbLeaderboardCalculator.elevation_gain(athlete).should == 0
    end
  end
  describe '.average_elevation' do
    it 'generates average elevation_gain for rider per ride over the month/year' do
      athlete = FactoryGirl.create(:athlete_with_rides)
      ClimbLeaderboardCalculator.average_elevation(athlete).should == 100
    end
    it 'returns zero when the user has no rides' do
      athlete = FactoryGirl.create(:athlete)
      ClimbLeaderboardCalculator.average_elevation(athlete).should == 0
    end
  end

end
