class AddMonthYearToLeaderboard < ActiveRecord::Migration
  def change
    add_column :leaderboards, :month, :integer, :null => false, :default => 1
    add_column :leaderboards, :year, :integer, :null => false, :default => 2012
  end
end
