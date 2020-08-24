class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category

  with_options presence: true do
    validates :prefecture_id
    validates :category_id
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