class AddUserToCUstomerOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :customer_orders, :user, null: false, foreign_key: true
  end
end
