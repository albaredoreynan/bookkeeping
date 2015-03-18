class Replacedaeformat < ActiveRecord::Migration
  def change
  	remove_column :employees, :birthdate
  	remove_column :payroll_records, :payroll_date_start	
    remove_column :payroll_records, :payroll_date_end

	add_column :employees, :birthdate, :datetime
  	add_column :payroll_records, :payroll_date_start, :datetime	
    add_column :payroll_records, :payroll_date_end, :datetime    
  end
end
