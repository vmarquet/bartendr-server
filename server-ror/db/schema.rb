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

ActiveRecord::Schema.define(version: 20150315162717) do

  create_table "articles", force: true do |t|
    t.string   "name",                 limit: 40,                                        null: false
    t.decimal  "price",                           precision: 8, scale: 2,                null: false
    t.string   "description"
    t.boolean  "availability",                                            default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
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
    t.integer  "table",                  null: false
    t.datetime "archived_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",               default: false, null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
