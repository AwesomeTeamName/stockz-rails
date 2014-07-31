class CreateStockData < ActiveRecord::Migration
  def change
    create_table :stock_data do |t|
      t.integer :stock_id

      t.decimal :value, precision: 10, scale: 2
      t.datetime :datetime

      t.timestamps
    end
  end
end
