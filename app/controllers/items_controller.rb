class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :user_confirmation, only: [:edit, :update, :destroy]
  before_action :item_present?, only: [:edit]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = ItemsTag.new
  end

  def create
    @item = ItemsTag.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @items_tag = ItemsTag.new(item: @item)
  end

  def update
    @items_tag = ItemsTag.new(item_params_update,item: @item)
    if @items_tag.valid?
      @items_tag.update
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end


  private

  def user_confirmation
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:items_tag).permit(:tag_name, :name, :introduce, :category_id, :state_id, :shipping_id, :region_id, :day_id, :price, images: []).merge(user_id: current_user.id)
  end
  
  def item_params_update
    params.require(:item).permit(:tag_name, :name, :introduce, :category_id, :state_id, :shipping_id, :region_id, :day_id, :price, images: []).merge(user_id: current_user.id)
  end

  def item_present?
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
