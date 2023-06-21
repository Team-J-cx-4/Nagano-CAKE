class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.new(customer_params)
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def quit
  end

  def out
  end

end
