require 'httparty'

class Club < ActiveRecord::Base
  include HTTParty
  base_uri 'http://app.strava.com/api/v1'

  has_one :leaderboard
  attr_accessible :description, :name, :strava_id

  # better than nil, as we'll see NoClubsFound in our stdout/logs
  NoClubsFound = Class.new

  def athletes
    athletes_json = self.class.get("/clubs/#{self.strava_id}/members")
    athletes_json['members'].map {|athlete| Athlete.new(athlete['id'], athlete['name']) }
  end

  def self.find_by_name_via_strava_api(name)
    clubs_json = self.get("/clubs", :query => {:name => name})
    return NoClubsFound if clubs_json['clubs'].empty?
    clubs_json['clubs'].map {|club| Club.new(:strava_id => club['id'], :name => club['name']) }
  end
end
