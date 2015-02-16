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

ActiveRecord::Schema.define(version: 20150215074819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "papers", force: :cascade do |t|
    t.integer  "type_of_conference"
    t.string   "paper_title"
    t.text     "abstract"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "paper_version1_file_name"
    t.string   "paper_version1_content_type"
    t.integer  "paper_version1_file_size"
    t.datetime "paper_version1_updated_at"
    t.string   "paper_version2_file_name"
    t.string   "paper_version2_content_type"
    t.integer  "paper_version2_file_size"
    t.datetime "paper_version2_updated_at"
    t.integer  "user_id"
    t.string   "paper_number"
  end

  add_index "papers", ["user_id"], name: "index_papers_on_user_id", using: :btree

  create_table "payment_details", force: :cascade do |t|
    t.integer  "amount"
    t.string   "dd_number"
    t.string   "bank"
    t.string   "branch"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "dd_copy_file_name"
    t.string   "dd_copy_content_type"
    t.integer  "dd_copy_file_size"
    t.datetime "dd_copy_updated_at"
    t.integer  "user_id"
    t.string   "user_number"
  end

  add_index "payment_details", ["user_id"], name: "index_payment_details_on_user_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "college_name"
    t.integer  "department"
    t.string   "email"
    t.string   "mobile_number"
    t.integer  "type_of_conference"
    t.string   "paper_title"
    t.text     "abstract"
    t.string   "file_upload_file_name"
    t.string   "file_upload_content_type"
    t.integer  "file_upload_file_size"
    t.datetime "file_upload_updated_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "registration_number"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "college_name"
    t.string   "mobile_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "designation"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "papers", "users"
  add_foreign_key "payment_details", "users"
end
