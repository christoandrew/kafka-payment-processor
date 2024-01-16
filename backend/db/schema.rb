# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_01_03_084843) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_accounts", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "reference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_payment_accounts_on_customer_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "payment_account_id", null: false
    t.integer "amount"
    t.text "payload"
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_account_id"], name: "index_payments_on_payment_account_id"
  end

  create_table "short_messages", force: :cascade do |t|
    t.text "text"
    t.datetime "sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_id", null: false
    t.integer "payment_id", null: false
    t.index ["customer_id"], name: "index_short_messages_on_customer_id"
    t.index ["payment_id"], name: "index_short_messages_on_payment_id"
  end

  add_foreign_key "payment_accounts", "customers"
  add_foreign_key "payments", "payment_accounts"
  add_foreign_key "short_messages", "customers"
  add_foreign_key "short_messages", "payments"
end
