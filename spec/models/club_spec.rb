require 'spec_helper'
require 'vcr'
require 'vcr_helper'

describe Club do
  describe '#athletes' do
    it 'returns an array of athletes' do
      VCR.use_cassette('strava_club_specs') do
        club = FactoryGirl.create(:club)
        athletes = club.athletes
        athletes.count.should > 0

        first_rider = athletes.first
        first_rider.should == athletes.first
        first_rider.name.should == 'Cameron Ross'
        first_rider.id.should == 4693
      end
    end
  end
  describe '.find_by_name_via_strava_api' do
    it 'pings strava_api and returns an unsaved Club instance when found' do
      VCR.use_cassette('strava_club_specs_find_by_name') do
        club = Club.find_by_name_via_strava_api('mission cycling').first
        club.should_not be_nil
        club.name.should == 'Mission Cycling'
        club.strava_id.should == 15
      end
    end
    it 'returns NoClubsFound when no clubs are found' do
      VCR.use_cassette('strava_club_specs_find_by_name_does_not_exist') do
        club = Club.find_by_name_via_strava_api('doesnotexistsridersclub')
        club.should == Club::NoClubsFound
      end
    end
  end
end
