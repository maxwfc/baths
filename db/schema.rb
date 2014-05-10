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

ActiveRecord::Schema.define(version: 20140508002843) do

  create_table "articles", force: true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "title"
    t.integer  "views"
    t.text     "draft"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mainImage_file_name"
    t.string   "mainImage_content_type"
    t.integer  "mainImage_file_size"
    t.datetime "mainImage_updated_at"
    t.integer  "excerpt_length"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "rich_rich_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        default: "file"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "twitter"
    t.string   "email"
    t.string   "crypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
