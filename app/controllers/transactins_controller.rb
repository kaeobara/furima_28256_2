class TransactinsController < ApplicationController
  
  def new

  end

  # def create
  #   @transaction = Transaction.new(price: transaction_params[:price])
  #   if @transaction.valid?
  #     pay_item
  #     @transaction.save
  #     return redirect_to root_path
  #   else
  #     render 'index'
  #   end
  # end

  # private

  # def transaction_params
  #   params.permit(:price, :token)
  # end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
  #   Payjp::Charge.create(
  #     amount: transaction_params[:price],  # 商品の値段
  #     card: transaction_params[:token],    # カードトークン
  #     currency:'jpy'                 # 通貨の種類(日本円)
  #   )
  # end


end
