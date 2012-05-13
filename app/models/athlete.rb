require 'httparty'
require_relative 'ride.rb'

class Athlete
  include HTTParty

  base_uri 'http://app.strava.com/api/v1'
  attr_accessor :id, :name, :rides

  def initialize(id, name)
    @id = id
    @name = name
  end

  def rides_for_month_year(month, year)
    offset = Time.new(year, month, 1)
    rides_json = self.class.get('/rides', :query => {:offset => 0, :athleteId => self.id, :startDate => offset})
    @rides = rides_json['rides'].map {|ride| Ride.new(ride['id'], ride['name']) }
    @rides
  end

  def total_elevation_for_month_year(month, year)
    if @rides.nil?
      @rides = self.rides_for_month_year(month, year)
    end
    return 0 if @rides.empty?
    @rides.map(&:elevation_gain).reduce(:+).round
  end

  def average_elevation_per_ride_for_month_year(month, year)
    if @rides.nil?
      @rides = self.rides_for_month_year(month, year)
    end
    return 0 if @rides.empty?
    (total_elevation_for_month_year(month, year) / @rides.count).round
  end
end
