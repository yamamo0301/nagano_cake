class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'You have created items successfully.'
      redirect_to admin_item_path
    else
      render :index
    end
  end

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end

end
