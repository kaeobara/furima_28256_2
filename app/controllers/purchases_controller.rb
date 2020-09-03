class PurchasesController < ApplicationController
  
  before_action :find_item_params, only: [:index, :new, :create]
  

  def index
    @purchase = Purchase.new
  end

  def new
    @purchase = PurchaseAddress.new
    if current_user.id == @item.user_id
      return redirect_to root_path
    end
    if @item.purchase.present?
      return redirect_to root_path
    end
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :new
    end

  end

  private

  def find_item_params
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
