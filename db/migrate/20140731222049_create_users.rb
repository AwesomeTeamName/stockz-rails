class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone_number
      t.decimal :credits, precision: 10, scale: 2

      t.timestamps
    end
  end
end
