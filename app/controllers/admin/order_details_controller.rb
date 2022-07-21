class Admin::OrderDetailsController < ApplicationController
  before_action :move_to_signed_in
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:notice] = 'You have updated order successfully.'
      redirect_to admin_order_path(@order_detail.order_id)
    else
      render :show
    end
  end


  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
  
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admin/sign_in'
    end
  end

end
