class CreateCustomerOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_orders do |t|
      t.string :email
      t.float :total
      t.string :status

      t.timestamps
    end
  end
end
