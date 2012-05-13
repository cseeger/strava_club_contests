FactoryGirl.define do
  factory :leaderboard_line_item do
    average_elevation 100
    elevation_gain 1000
    number_of_rides 10
    athlete_name 'Test Rider'
    leaderboard
  end

  factory :leaderboard do
    club

    factory :populated_leaderboard do
      after_create do |leaderboard, evaluator|
        FactoryGirl.create_list(:leaderboard_line_item, 1, leaderboard: leaderboard)
      end
    end
  end

  factory :club do
    name 'Mission Cycling'
    strava_id 15
  end
end

