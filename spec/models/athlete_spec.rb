require_relative '../../app/models/athlete.rb'
require 'vcr'
require 'vcr_helper'

describe Athlete do
  describe '#rides_by_month_year' do
    it 'returns all rides for the given month and year' do
      VCR.use_cassette('strava_rider_specs') do
        time = Time.new(2012, 4)
        rider = Athlete.new(4693, 'Cameron Ross')
        rides = rider.rides_for_month_year(time.month, time.year)
        rides.count.should > 0

        first_ride = rides.first
        first_ride.id.should == 7516475
        first_ride.name.should == 'Tam - Reverse Alpine'
      end
    end
  end

  describe '#total_elevation_for_month_year' do
    it 'calculates total_elevation for rider over give month and year' do
      VCR.use_cassette('strava_rider_specs_total_elevation') do
        time = Time.new(2012, 4)
        rider = Athlete.new(4693, 'Cameron Ross')
        rider.total_elevation_for_month_year(time.month, time.year).should == 5735
      end
    end
    it 'returns zero when the rider has no rides for the month and year' do
        time = Time.new(2012, 4)
        rider = Athlete.new(1, 'Lazy Rider')
        rider.stub(:rides_for_month_year).and_return([])
        rider.total_elevation_for_month_year(time.month, time.year).should == 0
    end
  end

  describe '#average_elevation_per_ride_for_month_year' do
    it 'calculates average_elevation for rider per ride over given month and year' do
      VCR.use_cassette('strava_rider_specs_average_elevation') do
        time = Time.new(2012, 4)
        rider = Athlete.new(4693, 'Cameron Ross')

        # total_elevation / number of rides
        # 5734 / 6 -- for our test subject (956 ft)
        rider.average_elevation_per_ride_for_month_year(time.month, time.year).should == 955
      end
    end
    it 'returns zero when there are no rides' do
      time = Time.new(2012, 4)
      rider = Athlete.new(1, 'Lazy Rider')

      # ye olde division by zero guard..
      rider.stub(:rides_for_month_year).and_return([])
      rider.average_elevation_per_ride_for_month_year(time.month, time.year).should == 0
    end
  end
end
