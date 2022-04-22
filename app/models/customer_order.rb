class CustomerOrder < ApplicationRecord
  has_many :order_details
  has_many :menus, through: :order_details 
  belongs_to :user
  validates :total, numericality: true, presence: true
  validates :email, presence: true
  validates :status, presence: true
end
