class Leaderboard < ActiveRecord::Base
  belongs_to :club
  has_many :leaderboard_line_items, :dependent => :destroy
end
