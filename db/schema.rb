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

ActiveRecord::Schema.define(version: 20190812073539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bodies", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address"
    t.string "zip_code"
    t.string "city"
    t.string "province"
    t.string "cod_fisc"
    t.bigint "body_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "body_code"
    t.bigint "building_id"
    t.index ["body_type_id"], name: "index_bodies_on_body_type_id"
    t.index ["building_id"], name: "index_bodies_on_building_id"
  end

  create_table "body_types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "building_types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address"
    t.string "zip_code"
    t.string "city"
    t.string "province"
    t.string "cod_fisc"
    t.bigint "building_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "building_code"
    t.index ["building_type_id"], name: "index_buildings_on_building_type_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_type", default: "", null: false
  end

  create_table "components", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outdoors", force: :cascade do |t|
    t.string "condition"
    t.string "note"
    t.string "attachment"
    t.bigint "component_id", null: false
    t.bigint "sub_component_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.string "name", default: "", null: false
    t.index ["building_id"], name: "index_outdoors_on_building_id"
    t.index ["component_id"], name: "index_outdoors_on_component_id"
    t.index ["sub_component_id"], name: "index_outdoors_on_sub_component_id"
  end

  create_table "sub_components", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "user_type", default: ""
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.string "picture", default: ""
    t.string "business_name", default: ""
    t.string "address", default: ""
    t.string "home_number", default: ""
    t.string "zip_code", default: ""
    t.string "city", default: ""
    t.string "province", default: ""
    t.string "cod_fisc", default: ""
    t.string "p_lva", default: ""
    t.string "mobile", default: ""
    t.string "phone", default: ""
    t.string "pec", default: ""
    t.string "cuu", default: ""
    t.string "specialization", default: ""
    t.string "building", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.bigint "category_id"
    t.integer "count_building_to_manage"
    t.index ["category_id"], name: "index_users_on_category_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "bodies", "body_types"
  add_foreign_key "bodies", "buildings"
  add_foreign_key "buildings", "building_types"
  add_foreign_key "outdoors", "buildings"
  add_foreign_key "outdoors", "components"
  add_foreign_key "outdoors", "sub_components"
  add_foreign_key "users", "categories"
end
