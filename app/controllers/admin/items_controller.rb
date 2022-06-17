class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end


  def item_params
    params.require(:item).permit(:name, :email, :image)
  end

end
