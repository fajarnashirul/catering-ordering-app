class Menu < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  validates :price, comparison: { greater_than_or_equal_to: 0.01 }

  validates :description, length: { maximum: 150, too_long: "description must less than 150 character"}
end
