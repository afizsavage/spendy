class User < ApplicationRecord
  has_many :categories, class_name: 'Category', foreign_key: :user_id, dependent: :destroy
  has_many :transactions, class_name: 'Transaction', foreign_key: :author_id, dependent: :destroy
end
