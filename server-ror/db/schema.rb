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

ActiveRecord::Schema.define(version: 20141103124757) do

  create_table "articles", force: true do |t|
    t.string   "name",         limit: 40,                                        null: false
    t.decimal  "price",                   precision: 8, scale: 2,                null: false
    t.string   "description"
    t.string   "category",     limit: 40
    t.string   "picture_url"
    t.boolean  "availability",                                    default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.decimal  "price"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "article_id"
  end

  add_index "items", ["article_id"], name: "index_items_on_article_id"
  add_index "items", ["order_id"], name: "index_items_on_order_id"

  create_table "orders", force: true do |t|
    t.boolean  "is_paid"
    t.boolean  "is_preparation_started"
    t.boolean  "is_preparation_done"
    t.boolean  "is_served"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
