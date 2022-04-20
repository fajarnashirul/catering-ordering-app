class OrderDetail < ApplicationRecord
  has_many :menus
  validates :menu_id, :customer_order_id, presence: true
  def self.total_price
    
  end
end
