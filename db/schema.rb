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

ActiveRecord::Schema.define(:version => 20120512172602) do

  create_table "athletes", :force => true do |t|
    t.string   "name"
    t.integer  "club_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "athletes", ["club_id"], :name => "index_athletes_on_club_id"

  create_table "clubs", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "leaderboards", :force => true do |t|
    t.integer  "club_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "leaderboards", ["club_id"], :name => "index_leaderboards_on_club_id"

  create_table "loaderboards_athletes", :id => false, :force => true do |t|
    t.integer "leaderboard_id"
    t.integer "athlete_id"
  end

  create_table "rides", :force => true do |t|
    t.float    "elevation_gain"
    t.integer  "athlete_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rides", ["athlete_id"], :name => "index_rides_on_athlete_id"

end
