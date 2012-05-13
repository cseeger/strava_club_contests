class ClimbLeaderboardCalculator
  def self.calculate_for_club(club)
    leaderboard = Leaderboard.new
    leaderboard.month = Time.now.month
    leaderboard.year = Time.now.year
    club.athletes.each do |athlete|
      line_item = LeaderboardLineItem.new
      line_item.athlete_name = athlete.name
      line_item.athlete_strava_id = athlete.id
      line_item.number_of_rides = athlete.rides_for_month_year(leaderboard.month, leaderboard.year).count
      line_item.elevation_gain = athlete.total_elevation_for_month_year(leaderboard.month, leaderboard.year)
      line_item.average_elevation = athlete.average_elevation_per_ride_for_month_year(leaderboard.month, leaderboard.year)
      line_item.leaderboard = leaderboard
      line_item.save
    end
    club.leaderboard = leaderboard
    club.save
  end
end
