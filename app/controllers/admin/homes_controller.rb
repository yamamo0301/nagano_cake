class Admin::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page]).order("id DESC")
    @total_amount = 0
  end
end
