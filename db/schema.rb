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

ActiveRecord::Schema.define(version: 20170505191248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "mobile"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.integer  "number"
    t.string   "complement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "category"
    t.string   "image"
    t.datetime "best_before"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.integer  "number"
    t.string   "complement"
    t.string   "weekday"
    t.integer  "inscription"
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "stall_id"
    t.decimal  "subtotal"
    t.decimal  "shipping"
    t.string   "bill_address"
    t.string   "number"
    t.text     "status"
    t.string   "ship_address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
    t.index ["stall_id"], name: "index_orders_on_stall_id", using: :btree
  end

  create_table "seller_items", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "item_id"
    t.string   "unity_type"
    t.string   "string"
    t.string   "box"
    t.boolean  "organic"
    t.boolean  "boolean"
    t.decimal  "price"
    t.decimal  "decimal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_seller_items_on_item_id", using: :btree
    t.index ["seller_id"], name: "index_seller_items_on_seller_id", using: :btree
  end

  create_table "sellers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "mobile"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.integer  "number"
    t.string   "complement"
    t.boolean  "delivery",       default: false
    t.text     "delivery_times"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["user_id"], name: "index_sellers_on_user_id", using: :btree
  end

  create_table "stalls", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_id"], name: "index_stalls_on_market_id", using: :btree
    t.index ["seller_id"], name: "index_stalls_on_seller_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "admins", "users"
  add_foreign_key "customers", "users"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "seller_items", "items"
  add_foreign_key "seller_items", "sellers"
  add_foreign_key "sellers", "users"
  add_foreign_key "stalls", "markets"
  add_foreign_key "stalls", "sellers"
end
