class CustomerOrder < ApplicationRecord
  validates :total, numericality: true, presence: true
  validates :email, presence: true
  validates :status, presence: true
end
