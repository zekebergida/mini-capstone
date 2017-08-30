class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render "index.html.erb"
  end

  def create
    carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: 'carted'
    )
    carted_product.save
    redirect_to "/cart"
  end
end
