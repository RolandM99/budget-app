class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :category_id, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
