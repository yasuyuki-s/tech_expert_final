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

ActiveRecord::Schema.define(version: 20180124140802) do

  create_table "follow_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "follow_by_id", null: false
    t.integer  "follow_to_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["follow_by_id", "follow_to_id"], name: "index_follow_relationships_on_follow_by_id_and_follow_to_id", unique: true, using: :btree
    t.index ["follow_to_id"], name: "fk_rails_eee919fa10", using: :btree
  end

  create_table "retweet_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "tweet_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id", "user_id"], name: "index_retweet_relationships_on_tweet_id_and_user_id", unique: true, using: :btree
    t.index ["tweet_id"], name: "index_retweet_relationships_on_tweet_id", using: :btree
    t.index ["user_id"], name: "index_retweet_relationships_on_user_id", using: :btree
  end

  create_table "tweets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "tweet",         limit: 65535
    t.string   "image"
    t.integer  "user_id",                                 null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "retweet_count",               default: 0, null: false
    t.index ["user_id"], name: "index_tweets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                              null: false
    t.string   "nickname",                                          null: false
    t.text     "biography",              limit: 65535
    t.string   "image_avatar"
    t.string   "image_canopy"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "tweets_count",                         default: 0,  null: false
    t.integer  "follows_count",                        default: 0,  null: false
    t.integer  "followers_count",                      default: 0,  null: false
  end

  add_foreign_key "follow_relationships", "users", column: "follow_by_id"
  add_foreign_key "follow_relationships", "users", column: "follow_to_id"
  add_foreign_key "retweet_relationships", "tweets"
  add_foreign_key "retweet_relationships", "users"
  add_foreign_key "tweets", "users"
end
