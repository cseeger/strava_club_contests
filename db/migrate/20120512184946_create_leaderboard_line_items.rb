class CreateLeaderboardLineItems < ActiveRecord::Migration
  def change
    create_table :leaderboard_line_items do |t|
      t.references :leaderboard
      t.float :average_elevation
      t.integer :number_of_rides
      t.float :elevation_gain
      t.string :athlete_name, :limit => 60

      t.timestamps
    end
    add_index :leaderboard_line_items, :leaderboard_id
  end
end
