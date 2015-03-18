class Addfieldsfromaccountinfors < ActiveRecord::Migration
  def change
  	add_column :account_infos, :payroll_record_id, :integer
  end
end
