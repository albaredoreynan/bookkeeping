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

ActiveRecord::Schema.define(version: 20150317050352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_infos", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "overtime_pay",         precision: 8, scale: 2
    t.decimal  "late",                 precision: 8, scale: 2
    t.decimal  "gross_pay",            precision: 8, scale: 2
    t.decimal  "pagibig_wheld",        precision: 8, scale: 2
    t.decimal  "gross_pay_after_hdmf", precision: 8, scale: 2
    t.decimal  "tax_wheld",            precision: 8, scale: 2
    t.decimal  "pag_ibig_loan",        precision: 8, scale: 2
    t.decimal  "housing_loan_sp_case", precision: 8, scale: 2
    t.decimal  "advances",             precision: 8, scale: 2
    t.decimal  "company_loan",         precision: 8, scale: 2
    t.decimal  "total_deduction",      precision: 8, scale: 2
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "payroll_record_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial"
    t.text     "address"
    t.string   "contact_number"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "position"
    t.decimal  "monthly_basic",   precision: 15, scale: 2, default: 0.0, null: false
    t.decimal  "semi_month_rate", precision: 15, scale: 2, default: 0.0, null: false
    t.datetime "birthdate"
  end

  create_table "payroll_records", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "payroll_date_start"
    t.datetime "payroll_date_end"
  end

end
