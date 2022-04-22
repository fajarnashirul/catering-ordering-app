class Menu < ApplicationRecord
  has_many :order_details
  has_many :customer_orders, through: :order_details
  belongs_to :category
  
  validates :name, presence: true, uniqueness: true
  
  validates :price, comparison: { greater_than_or_equal_to: 0.01 }

  validates :description, length: { maximum: 150, too_long: "description must less than 150 character"}


  # def insert_category(menu, categories)
  #   categories.each do |category|
  #     menu.categories << category
  #   end
  # end

  #  def self.by_params(params)
  #   where("id = #{params}").order("name")
  # end
    
end
