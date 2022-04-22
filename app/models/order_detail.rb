class OrderDetail < ApplicationRecord
  belongs_to :cutomer_order
  belongs_to :menu
  belongs_to :cart
  
  def total_price
    self.quantity * self.menu.price
  end

end
