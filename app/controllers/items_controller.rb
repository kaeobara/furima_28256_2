class ItemsController < ApplicationController  
  before_action :find_params, only: [:show, :edit, :update]
  

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
 



  private
  def item_params
    params.require(:item).permit(:prefecture_id, :category_id, :item_condition_id, :postage_payer_id, :shipping_day_id, :image, :name, :introduction, :price).merge(user_id: current_user.id)
  end

  def ensure_current_user
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end

    def find_params
      @item = Item.find(params[:id])
    end
  end




end
