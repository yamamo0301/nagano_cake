class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      flash[:notice] = '新規配送先を追加しました。'
      redirect_to addresses_path
    else
      render :index
    end
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = '配送先の内容を変更しました。'
      redirect_to addresses_path
    else
      render :index
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.customer_id == current_customer.id
      address.destroy

      redirect_to addresses_path
    end
  end


  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
