class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    @ordered_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    @ordered_products.each do |ordered_product|
      subtotal += ordered_product.product.price * ordered_product.quantity
    end
    tax = subtotal * 0.09
    total = tax + subtotal

    @order1 = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order1.save
    @ordered_products.each do |ordered_product|
      ordered_product.update(status: "purchased", order_id: @order1.id)
    end
    redirect_to "/orders/#{@order1.id}"

  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
