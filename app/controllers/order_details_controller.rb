class OrderDetailsController < ApplicationController
  def create
    chosen_menu = Menu.find(params[:menu_id])
    current_cart = @current_cart
    if current_cart.menus.include?(chosen_menu)
      # Find the line_item with the chosen_product
      @order_detail = current_cart.order_details.find_by(menu_id: chosen_menu)
      # Iterate the line_item's quantity by one
      @order_detail.quantity += 1
    else
      @order_detail = OrderDetail.new
      @order_detail.cart = current_cart
      @order_detail.menu = chosen_menu
    end

    # Save and redirect to cart show path
    @order_detail.save
    redirect_to cart_path(current_cart)
  end

  def destroy
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @order_detail = LineItem.find(params[:id])
    @order_detail.quantity += 1
    @order_detail.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @order_detail = LineItem.find(params[:id])
    @order_detail.quantity -= 1 if @order_detail.quantity > 1
    
    @order_detail.save
    redirect_to cart_path(@current_cart)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:quantity, :menu_id, :cart_id)
  end
end
