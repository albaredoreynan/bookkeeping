class Employee < ActiveRecord::Base
  has_many :account_infos
end
