class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :company_name, null: false
      t.string :email, null: false
      t.string :company_code
      t.integer :strength, default: 0
      t.string :website

      t.timestamps
    end
  end
end
