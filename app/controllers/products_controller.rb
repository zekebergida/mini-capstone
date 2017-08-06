class ProductsController < ApplicationController

  def all_products
    @full_line = Product.all
    render 'full_product_line.html.erb'
  end

  def add_product
  end

  def save_product
    new_product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
      )
    new_product.save
    @full_line = Product.all
    render 'full_product_line.html.erb'
  end

end
