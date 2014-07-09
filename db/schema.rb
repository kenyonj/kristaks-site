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

ActiveRecord::Schema.define(version: 20140708025702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: true do |t|
    t.integer  "store_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["store_id"], name: "index_employees_on_store_id", using: :btree

  create_table "hours", force: true do |t|
    t.integer  "store_id"
    t.string   "day"
    t.time     "opens_at"
    t.time     "closes_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hours", ["store_id"], name: "index_hours_on_store_id", using: :btree

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
