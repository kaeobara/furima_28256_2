class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :adress

  with_options presence: true do
    validates :postal_code
    validates :prefecture
    validates :city
    validates :house_number
    validates :phone_number
end
