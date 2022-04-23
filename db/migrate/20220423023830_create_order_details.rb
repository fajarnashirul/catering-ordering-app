class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :menu_id
      t.integer :cart_id
      t.integer :customer_order_id
      t.integer :quantity

      t.timestamps
    end
  end
end
