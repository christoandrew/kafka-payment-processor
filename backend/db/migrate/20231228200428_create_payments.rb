class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :payment_account, null: false, foreign_key: true
      t.integer :amount
      t.text :payload
      t.string :currency

      t.timestamps
    end
  end
end
