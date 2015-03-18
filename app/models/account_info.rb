class AccountInfo < ActiveRecord::Base
  belongs_to :employee
  belongs_to :payroll_record
end
