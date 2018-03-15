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


ActiveRecord::Schema.define(version: 2018_03_15_031128) do

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

  create_table "authorizations", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_authorizations_on_doctor_id"
    t.index ["record_id"], name: "index_authorizations_on_record_id"
  end

  create_table "before_pay_bookings", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.bigint "doctor_id"
    t.bigint "user_id"
    t.boolean "bill"
    t.string "doc_recommendations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_before_pay_bookings_on_doctor_id"
    t.index ["user_id"], name: "index_before_pay_bookings_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "date"
    t.string "start_time"
    t.time "end_time"
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.boolean "bill"
    t.string "doc_recommendations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_bookings_on_doctor_id"
    t.index ["patient_id"], name: "index_bookings_on_patient_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "postcode"
    t.string "country"
    t.string "phone"
    t.string "email"
    t.string "operation_hour"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.index ["doctor_id"], name: "index_clinics_on_doctor_id"
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

  create_table "lab_tests", force: :cascade do |t|
    t.bigint "record_id"
    t.string "test_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_lab_tests_on_record_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_likes_on_doctor_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pending_bookings", force: :cascade do |t|
    t.string "date"
    t.string "start_time"
    t.time "end_time"
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.boolean "bill"
    t.string "doc_recommendations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_pending_bookings_on_doctor_id"
    t.index ["patient_id"], name: "index_pending_bookings_on_patient_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "record_id"
    t.string "drug_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "pres_start_date"
    t.date "pres_end_date"
    t.string "dosage"
    t.boolean "meal"
    t.string "morning", limit: 255
    t.string "noon", limit: 255
    t.string "night", limit: 255
    t.index ["record_id"], name: "index_prescriptions_on_record_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "prescription"
    t.date "record_date"
    t.bigint "booking_id"
    t.string "referral_note"
    t.string "note"
    t.string "diagnosis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.string "title", limit: 255
    t.string "encounter", array: true
    t.string "symptoms"
    t.boolean "follow_up"
    t.boolean "referral"
    t.index ["booking_id"], name: "index_records_on_booking_id"
    t.index ["patient_id"], name: "index_records_on_patient_id"
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
    t.string "blood_type"
    t.string "med_history", array: true
    t.string "allergies", array: true
    t.string "family_history"
    t.string "social_history"
    t.boolean "drinker"
    t.boolean "smoker"
    t.string "verify"
    t.string "education"
    t.string "qualifications"
    t.text "summary"
    t.index ["email"], name: "index_users_on_email"
    t.index ["gender"], name: "index_users_on_gender"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "authorizations", "records"
  add_foreign_key "before_pay_bookings", "doctors"
  add_foreign_key "before_pay_bookings", "users"
  add_foreign_key "lab_tests", "records"
  add_foreign_key "prescriptions", "records"
  add_foreign_key "records", "bookings"
end
