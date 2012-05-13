class ClubContestController < ApplicationController
  def index
    @club = Club.first
    @leaderboard_line_items = @club.leaderboard.leaderboard_line_items.ranked_by_elevation_gain
  end
end

