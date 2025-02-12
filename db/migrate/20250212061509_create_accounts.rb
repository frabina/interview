class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :branch
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
