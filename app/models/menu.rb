class Menu < ApplicationRecord
  has_and_belongs_to_many :categories
  
  validates :name, presence: true, uniqueness: true
  
  validates :price, comparison: { greater_than_or_equal_to: 0.01 }

  validates :description, length: { maximum: 150, too_long: "description must less than 150 character"}


  def insert_category(menu, categories)
    validate :insert_category
    categories.each do |category|
      menu.categories << category
    end
  end
    
end
