class PurchasesController < ApplicationController
  before_action :authenticate_user! 
  before_action :item_find, only: [:index, :create]
  before_action :user_confirmation
  before_action :item_present?

  def index
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      @item_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def item_find
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:item_purchase).permit(:post, :region_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id,)
  end
  
  def user_confirmation
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def item_present?
    if @item.purchase.present?
      redirect_to root_path
    end
  end

end
