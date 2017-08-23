class OrdersController < ApplicationController
  def create
    subtotal = Product.find_by(id: params[:product_id]).price * params[:quantity].to_i
    tax = subtotal * 0.09
    total = tax + subtotal

    @order1 = Order.new(
      quantity: params[:quantity],
      user_id: current_user.id,
      product_id: params[:product_id],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order1.save
    redirect_to "/orders/#{@order1.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
