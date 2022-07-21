class Admin::OrdersController < ApplicationController
  before_action :move_to_signed_in

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    if params[:order][:status] == "payment_confirmation"
      @order_details.update_all(making_status: "awaiting_manufacture")
      @order.update(order_params)
      flash[:notice] = 'You have updated order successfully.'
      redirect_to admin_order_path(@order.id)
    elsif @order.update(order_params)
      flash[:notice] = 'You have updated order successfully.'
      redirect_to admin_order_path(@order.id)
    else
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
  
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admin/sign_in'
    end
  end

end
