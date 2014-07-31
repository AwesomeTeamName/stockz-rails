class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
