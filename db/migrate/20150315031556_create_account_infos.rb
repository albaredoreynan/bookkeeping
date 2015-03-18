class CreateAccountInfos < ActiveRecord::Migration
  def change
    create_table :account_infos do |t|
      t.integer :employee_id
      t.decimal :overtime_pay, precision: 8, scale: 2
      t.decimal :late, precision: 8, scale: 2
      t.decimal :gross_pay, precision: 8, scale: 2
      t.decimal :pagibig_wheld, precision: 8, scale: 2
      t.decimal :gross_pay_after_hdmf, precision: 8, scale: 2
      t.decimal :tax_wheld, precision: 8, scale: 2
      t.decimal :pag_ibig_loan, precision: 8, scale: 2
      t.decimal :housing_loan_sp_case, precision: 8, scale: 2
      t.decimal :advances, precision: 8, scale: 2
      t.decimal :company_loan, precision: 8, scale: 2
      t.decimal :total_deduction, precision: 8, scale: 2
      t.timestamps null: false
    end

    add_column :employees, :position, :string
    add_column :employees, :monthly_basic, :decimal, precision:15, scale: 2, default:0.0, null:false
    add_column :employees, :semi_month_rate, :decimal, precision:15, scale: 2, default:0.0, null:false

  end
end
