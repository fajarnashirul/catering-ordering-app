class CustomerOrderController < ApplicationController
  def index
    @customer_orders = CustomerOrder.all
  end

  def show
    @customer_order = CustomerOrder.find(params[:id])
  end

  def new
    @customer_order = CustomerOrder.new
  end

  def create
    @user = User.find(session[:user_id])
    @customer_order = CustomerOrder.new(customer_order_params)
    
    @current_cart.order_details.each do |menu|
    @customer_order.order_details << menu
    menu.cart_id = nil
    end
    @customer_order.save
    session[:cart_id] = nil
    redirect_to root_path
  end

  private
  def customer_order_params
    params.require(:customer_order).permit(:user_id, :email, :total, :status)
  end
end
