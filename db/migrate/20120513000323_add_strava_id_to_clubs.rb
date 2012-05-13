class AddStravaIdToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :strava_id, :integer, :unique => true
  end
end
