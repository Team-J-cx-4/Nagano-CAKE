class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = Customer.find(current_customer.id)
    @addresses = @customer.addresses.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path, notice: "配送先の登録に成功しました"
    else
      @customer = Customer.find(current_customer.id)
      @addresses = @customer.address.all
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: "変更を保存しました"
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.delete
    redirect_to addresses_path, notice: "配送先の削除に成功しました"
  end
  
  private
  
  def address_params
    params.require(:address).permit(:post_code, :address, :addressed_name, :customer_id)
  end
end
