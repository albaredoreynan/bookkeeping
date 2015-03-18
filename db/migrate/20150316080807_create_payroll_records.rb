class CreatePayrollRecords < ActiveRecord::Migration
  def change
    create_table :payroll_records do |t|
      t.date :payroll_date_start	
      t.date :payroll_date_end
      t.timestamps null: false
    end
  end
end
