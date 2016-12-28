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

ActiveRecord::Schema.define(version: 20161228142635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "trial_id"
    t.date     "startDate"
    t.date     "endDate"
    t.string   "location"
    t.integer  "capacity"
    t.string   "slug"
    t.integer  "master_event_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "events", ["master_event_id"], name: "index_events_on_master_event_id", using: :btree
  add_index "events", ["trial_id"], name: "index_events_on_trial_id", using: :btree

  create_table "master_events", force: :cascade do |t|
    t.string   "name"
    t.date     "startDate"
    t.date     "endDate"
    t.string   "country"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "organizer_id"
  end

  add_index "master_events", ["organizer_id"], name: "index_master_events_on_organizer_id", using: :btree

  create_table "organizers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trials", force: :cascade do |t|
    t.string   "name"
    t.integer  "sport_id"
    t.float    "totalDistance"
    t.string   "description"
    t.float    "level"
    t.string   "slug"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "trials", ["sport_id"], name: "index_trials_on_sport_id", using: :btree

  add_foreign_key "events", "master_events"
  add_foreign_key "events", "trials"
  add_foreign_key "master_events", "organizers"
  add_foreign_key "trials", "sports"
end
