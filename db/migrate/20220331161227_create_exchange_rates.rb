class CreateExchangeRates < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_rates do |t|
      t.integer :currency, null: false
      t.date :effective_date, null: false
      t.integer :precision, default: 2
      t.bigint :buy, null: false
      t.bigint :sell, null: false

      t.timestamps

      t.index [:effective_date, :currency], unique: true
    end
  end
end
