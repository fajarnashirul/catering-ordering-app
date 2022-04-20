class CustomerOrder < ApplicationRecord
  validates :total, numericality: true
end
