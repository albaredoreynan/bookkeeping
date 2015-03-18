class PayrollRecord < ActiveRecord::Base
  has_many :account_infos	
end
