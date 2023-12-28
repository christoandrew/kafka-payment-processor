class CreatePaymentAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_accounts do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :reference

      t.timestamps
    end
  end
end
