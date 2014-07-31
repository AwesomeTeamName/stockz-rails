class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :user_id
      t.integer :stock_id

      t.integer :quantity

      t.timestamps
    end
  end
end
