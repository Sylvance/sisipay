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

ActiveRecord::Schema[7.0].define(version: 2022_03_12_101531) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkouts", force: :cascade do |t|
    t.integer "amount"
    t.string "sender_token"
    t.string "recipient_token"
    t.string "identity"
    t.string "redirect_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "email"
    t.string "password_digest"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "amount"
    t.string "sender_token"
    t.string "recipient_token"
    t.string "checkout_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
