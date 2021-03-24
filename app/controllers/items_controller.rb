class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]

  def index
    @items = Item.order(created_at: :desc)
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in?
      redirect_to new_user_session 
    end
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :introduce, :category_id, :state_id, :shipping_id, :region_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
