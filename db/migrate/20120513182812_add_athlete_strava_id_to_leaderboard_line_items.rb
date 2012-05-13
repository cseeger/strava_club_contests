class AddAthleteStravaIdToLeaderboardLineItems < ActiveRecord::Migration
  def change
    add_column :leaderboard_line_items, :athlete_strava_id, :integer
    add_index :leaderboard_line_items, :athlete_strava_id
  end
end
