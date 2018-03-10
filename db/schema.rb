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

ActiveRecord::Schema.define(version: 2018_03_10_190851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "healths", force: :cascade do |t|
    t.date "date"
    t.float "height"
    t.float "weight"
    t.integer "blood_pressure"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_healths_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "first_name", null: false
    t.string "last_name"
    t.date "birthdate"
    t.string "email"
    t.integer "gender", default: 0
    t.string "phone"
    t.string "identification"
    t.string "profile_picture"
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "booked_time"
    t.date "booked_date"
    t.string "specialist"
    t.integer "experienced_years"
    t.integer "license"
    t.string "clinic_name"
    t.string "clinic_phone"
    t.string "clinic_address"
    t.string "clinic_city"
    t.string "clinic_state"
    t.string "clinic_country"
    t.string "blood_type"
    t.string "med_history"
    t.string "allergies"
    t.string "family_history"
    t.string "social_history"
    t.boolean "drinker"
    t.boolean "smoker"
    t.index ["email"], name: "index_users_on_email"
    t.index ["gender"], name: "index_users_on_gender"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
end
