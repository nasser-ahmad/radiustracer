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

ActiveRecord::Schema.define(version: 20171022084809) do

  create_table "action_logs", force: :cascade do |t|
    t.string "username"
    t.integer "action_type"
    t.boolean "finished"
    t.string "notice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_types", force: :cascade do |t|
    t.string "action_type"
  end

  create_table "ip_range_notes", force: :cascade do |t|
    t.string "note"
    t.integer "ip_range_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ip_ranges", force: :cascade do |t|
    t.string "ip_range"
    t.integer "isp_id"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subnet_mask"
  end

  create_table "isp_adsl_accounts", force: :cascade do |t|
    t.integer "isp_id"
    t.string "account"
    t.string "adsl_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "isp_hrs", force: :cascade do |t|
    t.string "name"
    t.string "job"
    t.string "home_n"
    t.string "home_n2"
    t.string "work_n"
    t.string "work_n2"
    t.string "mob_n"
    t.string "mob_n2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "isp_id"
    t.string "address"
  end

  create_table "isps", force: :cascade do |t|
    t.string "name"
    t.string "isp_ip_ranges"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
  end

  create_table "notes", force: :cascade do |t|
    t.string "note"
    t.integer "isp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "isp_id"
    t.string "public_ip"
    t.string "private_ip"
    t.string "router_ip"
    t.datetime "assign_date"
    t.datetime "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "rad_assign_date"
    t.datetime "rad_release_date"
    t.boolean "has_error", default: false
    t.string "note"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
