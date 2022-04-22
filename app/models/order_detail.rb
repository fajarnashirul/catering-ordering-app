class OrderDetail < ApplicationRecord
  belongs_to :cutomer_order
  belongs_to :menu
end
