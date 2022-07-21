class Admin::ItemsController < ApplicationController
  before_action :move_to_signed_in

  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'You have created items successfully.'
      redirect_to admin_item_path(@item.id)
    else
      render :new
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
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end

  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admin/sign_in'
    end
  end

end
