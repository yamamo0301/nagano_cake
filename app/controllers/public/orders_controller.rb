class Public::OrdersController < ApplicationController
  protect_from_forgery

  def new
    @order = current_customer.orders.new
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    if params[:order][:address_id] == "1"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif  params[:order][:address_id] == "2"
      @address = Address.find(params[:order][:address_select])
      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      redirect_to addresses_path
    elsif  params[:order][:address_id] == "3"
    else
      render root_path
    end
  end

  def complete

  end

  def create

  end

  def index

  end

  def show

  end


  private

  def order_params
    params.require(:order).permit(
      :customer_id,
      :shipping_cost,
      :payment_method,
      :postal_code,
      :name,
      :address,
      :total_payment,
      :status)
  end

end
