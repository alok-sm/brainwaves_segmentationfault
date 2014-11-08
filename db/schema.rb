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

ActiveRecord::Schema.define(version: 20141108174824) do

  create_table "claims", force: true do |t|
    t.string   "claim_text"
    t.string   "claim_status"
    t.integer  "claim_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clauses", force: true do |t|
    t.integer  "dispute_id"
    t.string   "clause_text"
    t.string   "clause_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disputes", force: true do |t|
    t.string   "company"
    t.string   "policy_name"
    t.string   "policy_text"
    t.string   "policy_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

end
