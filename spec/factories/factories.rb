FactoryGirl.define do

  # post factory with a `belongs_to` association for the user
  factory :ride do
    elevation_gain '100'
    athlete
  end

  # post factory with a `belongs_to` association for the user
  factory :athlete do
    name 'Kevin Climber'
    club

    factory :athlete_with_rides do
      after_create do |athlete, evaluator|
        FactoryGirl.create_list(:ride, 10, athlete: athlete)
      end
    end
  end

  # user factory without associated posts
  factory :club do
    name 'Rails Riders'

    # user_with_posts will create post data after the user has been created
    factory :club_with_athletes do
      ignore do
        athletes_count 2
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after_create do |club, evaluator|
        FactoryGirl.create_list(:athlete_with_rides, evaluator.athletes_count, club: club)
      end
    end
  end
end

