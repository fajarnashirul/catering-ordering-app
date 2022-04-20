class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :phone, presence: true
  validates :password, presence: true
end
