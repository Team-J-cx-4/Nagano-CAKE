class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:item_create] = "商品を追加しました"
      redirect_to admin_items_path
    else
      redirect_back fallback_location: root_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path
      flash[:notice_update] = "商品情報を更新しました"
    else
      redirect_back fallback_location: root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_stated)
  end

end
