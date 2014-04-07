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

ActiveRecord::Schema.define(version: 20140407191002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: true do |t|
    t.integer  "meditation_id"
    t.integer  "mystic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accesses", ["meditation_id"], name: "index_accesses_on_meditation_id", using: :btree
  add_index "accesses", ["mystic_id"], name: "index_accesses_on_mystic_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "mystic_id"
    t.string   "subject_type"
    t.integer  "subject_id"
    t.text     "text"
    t.integer  "is_reply_to"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["mystic_id"], name: "index_comments_on_mystic_id", using: :btree

  create_table "creatrixes", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.boolean  "active"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "creatrixes", ["email"], name: "index_creatrixes_on_email", unique: true, using: :btree
  add_index "creatrixes", ["reset_password_token"], name: "index_creatrixes_on_reset_password_token", unique: true, using: :btree

  create_table "credit_cards", force: true do |t|
    t.integer  "mystic_id"
    t.string   "stripe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credit_cards", ["mystic_id"], name: "index_credit_cards_on_mystic_id", using: :btree

  create_table "goddesses", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "personal_statement"
    t.integer  "mystic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group_choice"
  end

  create_table "inclusions", force: true do |t|
    t.integer  "product_id"
    t.integer  "meditation_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "inclusions", ["meditation_id"], name: "index_inclusions_on_meditation_id", using: :btree
  add_index "inclusions", ["product_id"], name: "index_inclusions_on_product_id", using: :btree

  create_table "meditations", force: true do |t|
    t.string   "name"
    t.string   "soundcloud_url"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "free"
    t.boolean  "active"
    t.text     "embed"
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
    t.string   "stripe_id"
  end

  add_index "mystics", ["confirmation_token"], name: "index_mystics_on_confirmation_token", unique: true, using: :btree
  add_index "mystics", ["email"], name: "index_mystics_on_email", unique: true, using: :btree
  add_index "mystics", ["reset_password_token"], name: "index_mystics_on_reset_password_token", unique: true, using: :btree

  create_table "prices", force: true do |t|
    t.integer  "product_id"
    t.integer  "cents"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "active"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["product_id"], name: "index_prices_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.boolean  "active"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "purchases", force: true do |t|
    t.integer  "product_id"
    t.integer  "mystic_id"
    t.integer  "price_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["mystic_id"], name: "index_purchases_on_mystic_id", using: :btree
  add_index "purchases", ["price_id"], name: "index_purchases_on_price_id", using: :btree
  add_index "purchases", ["product_id"], name: "index_purchases_on_product_id", using: :btree

  create_table "share_links", force: true do |t|
    t.string   "url"
    t.integer  "clicks"
    t.integer  "shares"
    t.integer  "creatrix_id"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "share_links", ["creatrix_id"], name: "index_share_links_on_creatrix_id", using: :btree

end
