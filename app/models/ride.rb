require 'httparty'

class Ride
  include HTTParty

  base_uri 'http://app.strava.com/api/v1'
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def elevation_gain
    ride_json = self.class.get("/rides/#{self.id}")
    ride_json['ride']['elevationGain']
  end
end
