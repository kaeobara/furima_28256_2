class Transaction < ApplicationRecord
  validates :price, presence: true
end
