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

ActiveRecord::Schema.define(version: 20150413031055) do

  create_table "numbers", force: :cascade do |t|
    t.string   "value",       null: false
    t.integer  "decimal",     null: false
    t.integer  "tenant_id",   null: false
    t.integer  "sequence_id", null: false
    t.string   "descriptor"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "numbers", ["sequence_id"], name: "index_numbers_on_sequence_id"
  add_index "numbers", ["tenant_id"], name: "index_numbers_on_tenant_id"
  add_index "numbers", ["value"], name: "index_numbers_on_value"

  create_table "sequences", force: :cascade do |t|
    t.string   "prefix"
    t.string   "delimiter"
    t.string   "descriptor", null: false
    t.integer  "width",      null: false
    t.string   "alphabet"
    t.integer  "tenant_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sequences", ["tenant_id"], name: "index_sequences_on_tenant_id"

  create_table "tenants", force: :cascade do |t|
    t.string   "access_key"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tenants", ["access_key"], name: "index_tenants_on_access_key", unique: true
  add_index "tenants", ["name"], name: "index_tenants_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.integer  "tenant_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["tenant_id"], name: "index_users_on_tenant_id"

end
