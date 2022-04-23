class Cart < ActiveRecord::Base
  has_many :order_details, dependent: :destroy
  has_many :menus, through: :order_details


  def sub_total
    sum = 0
    self.order_details.each do |order_detail|
      sum+= order_detail.total_price
    end
    return sum
  end
end
