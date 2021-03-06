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

ActiveRecord::Schema.define(version: 20170124191050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                                null: false
    t.string   "avatar"
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.integer  "podcast_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id", "podcast_id"], name: "index_categorizations_on_category_id_and_podcast_id", unique: true, using: :btree
    t.index ["category_id"], name: "index_categorizations_on_category_id", using: :btree
    t.index ["podcast_id"], name: "index_categorizations_on_podcast_id", using: :btree
  end

  create_table "hosts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name",       null: false
    t.index ["name"], name: "index_hosts_on_name", using: :btree
  end

  create_table "podcast_hosts", force: :cascade do |t|
    t.integer  "host_id",    null: false
    t.integer  "podcast_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id", "podcast_id"], name: "index_podcast_hosts_on_host_id_and_podcast_id", unique: true, using: :btree
    t.index ["host_id"], name: "index_podcast_hosts_on_host_id", using: :btree
    t.index ["podcast_id"], name: "index_podcast_hosts_on_podcast_id", using: :btree
  end

  create_table "podcasts", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "provider_id",    null: false
    t.text     "description"
    t.integer  "release_year"
    t.string   "itunes_url"
    t.string   "soundcloud_url"
    t.string   "image_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id",        null: false
    t.index ["provider_id", "name"], name: "index_podcasts_on_provider_id_and_name", unique: true, using: :btree
    t.index ["provider_id"], name: "index_podcasts_on_provider_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_providers_on_name", unique: true, using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",     null: false
    t.string   "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "podcast_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["podcast_id"], name: "index_reviews_on_podcast_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "avatar"
    t.string   "name",                                null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id",               null: false
    t.integer "review_id",             null: false
    t.integer "value",     default: 0, null: false
    t.index ["review_id"], name: "index_votes_on_review_id", using: :btree
    t.index ["user_id", "review_id"], name: "index_votes_on_user_id_and_review_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

end
