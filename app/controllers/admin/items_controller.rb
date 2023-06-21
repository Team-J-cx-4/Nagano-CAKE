class Admin::ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image)
  end

end
