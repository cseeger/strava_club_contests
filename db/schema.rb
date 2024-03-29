# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120513182812) do

  create_table "clubs", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "strava_id"
  end

  create_table "leaderboard_line_items", :force => true do |t|
    t.integer  "leaderboard_id"
    t.integer  "average_elevation"
    t.integer  "number_of_rides"
    t.integer  "elevation_gain"
    t.string   "athlete_name",      :limit => 60
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "athlete_strava_id"
  end

  add_index "leaderboard_line_items", ["athlete_strava_id"], :name => "index_leaderboard_line_items_on_athlete_strava_id"
  add_index "leaderboard_line_items", ["leaderboard_id"], :name => "index_leaderboard_line_items_on_leaderboard_id"

  create_table "leaderboards", :force => true do |t|
    t.integer  "club_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "month",      :default => 1,    :null => false
    t.integer  "year",       :default => 2012, :null => false
  end

  add_index "leaderboards", ["club_id"], :name => "index_leaderboards_on_club_id"

end
