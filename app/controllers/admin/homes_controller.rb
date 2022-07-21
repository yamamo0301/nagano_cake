class Admin::HomesController < ApplicationController
  before_action :move_to_signed_in

  def top
    @orders = Order.page(params[:page]).order("id DESC")
    @total_amount = 0
  end


  private

  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admin/sign_in'
    end
  end

end
