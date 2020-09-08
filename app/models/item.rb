class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_day
  has_one_attached :image
  # has_one :purchase, foreign_key: :item_id, dependent: :destroy
  has_one :purchase, dependent: :destroy


  with_options presence: true do
    validates :image
    validates :prefecture_id
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :shipping_day_id
    validates :name, length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  end
end
  
# private
#   def product_params
#     params.require(:product)
#       .permit(:name, :description, :price, :condition, :brand, :send_price,
#               :ship_day, images_attributes: [:name])
#       .merge(user_id: current_user.id, category_id: params[:product][:category_id],
#             prefecture_id: params[:product][:prefecture_id], status: 0)
#end