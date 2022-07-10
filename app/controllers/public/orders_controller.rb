class Public::OrdersController < ApplicationController
  # protect_from_forgery
  # before_action :authenticate_customer!
  # skip_before_action :verify_authenticity_token

  def new
    @order = Order.new
  end

  def confirm
    @total_price = 0
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if params[:order][:address_id] == "1"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif  params[:order][:address_id] == "2"
      @address = Address.find(params[:order][:address_select])
      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address = @address.address
    elsif  params[:order][:address_id] == "3"
    else
      render new_orders_path
    end
  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    @order.save
    flash[:notice] = 'You have created orders successfully.'
    redirect_to orders_complete_path
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
