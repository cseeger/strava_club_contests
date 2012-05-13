require_relative '../../app/models/ride.rb'
require 'vcr'
require 'vcr_helper'

describe Ride do
  describe '#feet_climbed' do
    it 'returns the number of feet climbed during the ride' do
      VCR.use_cassette('strava_ride_specs') do
        ride = Ride.new(7516475, 'Tam - Reverse Alpine')
        ride.elevation_gain.should == 1094.2
      end
    end
  end
end
