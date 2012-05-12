class ClimbLeaderboardCalculator
  def self.calculate_for_club(club)
    leaderboard = Leaderboard.new
    leaderboard.month = Time.now.month
    leaderboard.year = Time.now.year
    club.athletes.each do |athlete|
      line_item = LeaderboardLineItem.new
      line_item.athlete_name = 'Kevin Climber'
      line_item.number_of_rides = athlete.rides.count
      line_item.elevation_gain = self.elevation_gain(athlete)
      line_item.average_elevation = self.average_elevation(athlete)
      line_item.leaderboard = leaderboard
      line_item.save
    end
    club.leaderboard = leaderboard
    club.save
  end

  def self.elevation_gain(athlete)
    rides = athlete.rides
    return 0 if rides.empty?

    rides.map(&:elevation_gain).reduce(:+)
  end

  def self.average_elevation(athlete)
    rides = athlete.rides
    return 0 if rides.empty?

    self.elevation_gain(athlete) / rides.count
  end
end
