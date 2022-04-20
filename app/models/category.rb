class Category < ApplicationRecord
  has_many :menus_category
  has_many :menus, :through => :menus_category
end
