# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_26_033306) do
  create_table "cron_job_callbacks", force: :cascade do |t|
    t.string "external_uuid", null: false
    t.integer "cron_job_id", null: false
    t.string "integration_type"
    t.integer "integration_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cron_job_id"], name: "index_cron_job_callbacks_on_cron_job_id"
    t.index ["integration_type", "integration_id"], name: "index_cron_job_callbacks_on_integration"
  end

  create_table "cron_jobs", force: :cascade do |t|
    t.string "external_uuid", null: false
    t.string "name", null: false
    t.string "expression", null: false
    t.datetime "last_run_at"
    t.datetime "next_run_at", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "active", null: false
    t.index ["user_id"], name: "index_cron_jobs_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "webhook_integrations", force: :cascade do |t|
    t.string "url", null: false
    t.string "http_method", null: false
    t.string "request_body", null: false
    t.string "headers", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cron_job_callbacks", "cron_jobs"
  add_foreign_key "cron_jobs", "users"
  add_foreign_key "sessions", "users"
end
