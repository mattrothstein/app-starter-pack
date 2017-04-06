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

ActiveRecord::Schema.define(version: 20170406034105) do

  create_table "grouped_items", force: :cascade do |t|
    t.integer  "inventory_item_group_id"
    t.integer  "inventory_item_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["inventory_item_group_id"], name: "index_grouped_items_on_inventory_item_group_id"
    t.index ["inventory_item_id"], name: "index_grouped_items_on_inventory_item_id"
  end

  create_table "inventory_item_groups", force: :cascade do |t|
    t.integer  "inventory_location_id"
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["inventory_location_id"], name: "index_inventory_item_groups_on_inventory_location_id"
  end

  create_table "inventory_item_units", force: :cascade do |t|
    t.integer  "inventory_item_id"
    t.date     "checked_out"
    t.date     "checked_in"
    t.string   "checked_out_by"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["inventory_item_id"], name: "index_inventory_item_units_on_inventory_item_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.integer  "inventory_location_id"
    t.string   "name"
    t.integer  "price"
    t.string   "unit_of_measurement"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "barcode_file_name"
    t.string   "barcode_content_type"
    t.integer  "barcode_file_size"
    t.datetime "barcode_updated_at"
    t.index ["inventory_location_id"], name: "index_inventory_items_on_inventory_location_id"
  end

  create_table "inventory_locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_approval_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "notes"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_project_approval_requests_on_user_id"
  end

  create_table "purchase_order_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "notes"
    t.integer  "price"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "price_in_pennies"
    t.index ["user_id"], name: "index_purchase_order_requests_on_user_id"
  end

  create_table "support_requests", force: :cascade do |t|
    t.string   "status"
    t.string   "issue"
    t.string   "priority"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_support_requests_on_user_id"
  end

  create_table "time_off_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_time_off_requests_on_user_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_type_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

end
