class AddCartToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_details, :cart, null: false, foreign_key: true
  end
end
