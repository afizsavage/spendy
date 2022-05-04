class Transaction < ApplicationRecord
  belongs_to :category, class_name: 'Category'
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :amount, presence: true
  validates :groupe, presence: true
  validates :author, presence: true

  def self.total_amount(transaction)
    sum = 0
    transaction.each do |e|
      sum += e.amount
    end
    sum
  end
end
