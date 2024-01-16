class AddsFieldsToShortMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :short_messages, :customer, null: false, foreign_key: true
    add_reference :short_messages, :payment, null: false, foreign_key: true
  end
end
