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

ActiveRecord::Schema.define(version: 20141011055235) do

  create_table "locations", force: true do |t|
    t.string   "loc_id"
    t.string   "loc_name"
    t.string   "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "rest_id"
    t.string   "name"
    t.string   "location"
    t.string   "loc_id"
    t.string   "zone_name"
    t.string   "zone_id"
    t.string   "city_name"
    t.string   "city_id"
    t.string   "cuisines"
    t.string   "twitter_handle"
    t.string   "cost_for_two"
    t.string   "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "rest_id"
    t.string   "user"
    t.string   "review_text"
    t.string   "rating"
    t.string   "sentiment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
