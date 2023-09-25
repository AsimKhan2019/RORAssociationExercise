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

ActiveRecord::Schema[7.0].define(version: 2023_09_25_133647) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_clients", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_clients_on_account_id"
    t.index ["client_id"], name: "index_account_clients_on_client_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_payment_subscriptions", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "payment_id", null: false
    t.bigint "subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_payment_subscriptions_on_client_id"
    t.index ["payment_id"], name: "index_client_payment_subscriptions_on_payment_id"
    t.index ["subscription_id"], name: "index_client_payment_subscriptions_on_subscription_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.date "date"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscription_accounts", force: :cascade do |t|
    t.bigint "subscription_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_subscription_accounts_on_account_id"
    t.index ["subscription_id"], name: "index_subscription_accounts_on_subscription_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.decimal "price"
    t.integer "validity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "account_clients", "accounts"
  add_foreign_key "account_clients", "clients"
  add_foreign_key "client_payment_subscriptions", "clients"
  add_foreign_key "client_payment_subscriptions", "payments"
  add_foreign_key "client_payment_subscriptions", "subscriptions"
  add_foreign_key "subscription_accounts", "accounts"
  add_foreign_key "subscription_accounts", "subscriptions"
end
