class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :middle_initial
    	t.text   :address
    	t.string :contact_number
    	t.date   :birthdate
      t.timestamps null: false
    end
  end
end
