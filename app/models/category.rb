class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :user_id, presence: true

  # def total_amount
  #   transactions.sum(:amount)
  # end
end
