class ItemsController < ApplicationController
  


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

<<<<<<< Updated upstream
  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def updata
  end
 
=======
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
>>>>>>> Stashed changes



  private
  def item_params
    params.require(:item).permit(:prefecture_id, :category_id, :item_condition_id, :postage_payer_id, :shipping_day_id, :image, :name, :introduction, :price).merge(user_id: current_user.id)
  end

  def ensure_current_user
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  # def set_prefecture
  #   @prefecture = Prefecture.find(@item.prefecture_id)
  # end



end
