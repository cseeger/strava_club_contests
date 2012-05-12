class Athlete < ActiveRecord::Base
  belongs_to :club
  has_many :rides

  attr_accessible :name
end
