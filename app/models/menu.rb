class Menu < ApplicationRecord
  has_and_belongs_to_many :categories
  
  validates :name, presence: true, uniqueness: true
  
  validates :price, comparison: { greater_than_or_equal_to: 0.01 }

  validates :description, length: { maximum: 150, too_long: "description must less than 150 character"}

  def self.find_category
    Menu.last.categories.select(:name)
  end
    
end
