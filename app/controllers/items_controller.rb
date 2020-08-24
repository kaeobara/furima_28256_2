class ItemsController < ApplicationController
  


  def index
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit( :prefecture_id, :category_id)
  end

  # def set_prefecture
  #   @prefecture = Prefecture.find(@item.prefecture_id)
  # end



end
