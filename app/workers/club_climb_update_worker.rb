class ClubClimbUpdateWorker

  def self.perform
    clubs = Club.all
    clubs.each do |club|
      Rails.logger.info "Processing climb data for #{club.name}"
      ClimbLeaderboardCalculator.calculate_for_club(club)
      Rails.logger.info "Climb data for #{club.name} complete"
    end
  end

end
