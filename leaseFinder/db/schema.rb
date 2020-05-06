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

ActiveRecord::Schema.define(version: 2020_04_19_201410) do

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "phone"
    t.string "website"
    t.string "office"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.integer "total_bedrooms"
    t.integer "total_bathrooms"
    t.boolean "pet_friendly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "landlord_id"
    t.index ["landlord_id"], name: "index_properties_on_landlord_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "propertyID"
    t.text "review"
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.integer "student_id"
    t.index ["property_id"], name: "index_reviews_on_property_id"
    t.index ["student_id"], name: "index_reviews_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "password"
    t.string "phone"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "sublet_posts", force: :cascade do |t|
    t.integer "housemates_num"
    t.float "monthly_rent"
    t.boolean "water_flag"
    t.boolean "gas_flag"
    t.boolean "electric_flag"
    t.boolean "internet_flag"
    t.boolean "other_util_flag"
    t.date "start_date"
    t.date "end_date"
    t.integer "bedroom_num"
    t.boolean "furnished_flag"
    t.boolean "parking_flag"
    t.text "house_rules"
    t.boolean "taken"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.integer "student_id"
    t.index ["property_id"], name: "index_sublet_posts_on_property_id"
    t.index ["student_id"], name: "index_sublet_posts_on_student_id"
  end

end
