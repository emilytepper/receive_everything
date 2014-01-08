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

ActiveRecord::Schema.define(version: 20140108125016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inclusions", force: true do |t|
    t.integer  "product_id"
    t.integer  "meditation_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inclusions", ["meditation_id"], name: "index_inclusions_on_meditation_id", using: :btree
  add_index "inclusions", ["product_id"], name: "index_inclusions_on_product_id", using: :btree

  create_table "meditations", force: true do |t|
    t.string   "name"
    t.string   "soundcloud_url"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mystics", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook_id"
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mystics", ["confirmation_token"], name: "index_mystics_on_confirmation_token", unique: true, using: :btree
  add_index "mystics", ["email"], name: "index_mystics_on_email", unique: true, using: :btree
  add_index "mystics", ["reset_password_token"], name: "index_mystics_on_reset_password_token", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.boolean  "active"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
