class PurchaseAddress

include ActiveModel::Model
attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :purchase_id

with_options presence: true do
  validates :postal_code, length: { maximum: 8 }, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id
  validates :city
  validates :house_number
  validates :phone_number,length: { maximum: 11 }, format: {with: /\A[0-9]+\z/}
  validates :user_id
  validates :item_id
  validates :token
end

def save
  purchase = Purchase.create(item_id: item_id, user_id: user_id)
  Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end