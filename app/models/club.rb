class Club < ActiveRecord::Base
  has_many :athletes
  attr_accessible :description, :name
end
