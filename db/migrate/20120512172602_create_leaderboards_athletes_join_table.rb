class CreateLeaderboardsAthletesJoinTable < ActiveRecord::Migration
  create_table :loaderboards_athletes, :id => false do |t|
    t.integer :leaderboard_id
    t.integer :athlete_id
  end
end
