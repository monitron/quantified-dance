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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140313185338) do

  create_table "charts", force: true do |t|
    t.integer  "song_id"
    t.string   "steps_type"
    t.string   "difficulty"
    t.integer  "meter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plays", force: true do |t|
    t.string   "guid"
    t.integer  "profile_id"
    t.string   "grade"
    t.integer  "score"
    t.float    "percent_dp"
    t.integer  "max_combo"
    t.float    "survive_seconds"
    t.datetime "played_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chart_id"
  end

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "guid"
    t.date     "last_played_on"
    t.integer  "total_play_seconds"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "dir"
    t.string   "group"
    t.string   "title"
    t.string   "subtitle"
    t.string   "artist"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
