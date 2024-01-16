class CreateShortMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :short_messages do |t|
      t.text :text
      t.datetime :sent_at

      t.timestamps
    end
  end
end
