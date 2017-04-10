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

ActiveRecord::Schema.define(version: 20170410130042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "markets", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "weekday"
    t.integer  "inscription"
    t.string   "name"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.string   "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "amount"
    t.integer  "user_id"
    t.integer  "stall_id"
    t.index ["stall_id"], name: "index_orders_on_stall_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.string   "category"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "photo"
    t.integer  "best_before", default: 1
  end

  create_table "seller_products", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "unity_type"
    t.string   "box"
    t.boolean  "organic"
    t.decimal  "price"
    t.integer  "farmer_id"
    t.index ["farmer_id"], name: "index_seller_products_on_farmer_id", using: :btree
    t.index ["product_id"], name: "index_seller_products_on_product_id", using: :btree
  end

  create_table "sellers", force: :cascade do |t|
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
    t.string   "name"
    t.string   "mobile"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.integer  "number"
    t.string   "complement"
    t.index ["email"], name: "index_sellers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "stalls", force: :cascade do |t|
    t.integer  "farmer_id"
    t.integer  "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farmer_id"], name: "index_stalls_on_farmer_id", using: :btree
    t.index ["market_id"], name: "index_stalls_on_market_id", using: :btree
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "mobile"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.integer  "number"
    t.string   "complement"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "stalls"
  add_foreign_key "orders", "users"
  add_foreign_key "seller_products", "products"
  add_foreign_key "stalls", "markets"
  add_foreign_key "stalls", "sellers", column: "farmer_id"
end
