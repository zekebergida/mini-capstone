class ProductsController < ApplicationController

  def all_products
    @full_line = Product.all
    render 'full_product_line.html.erb'
  end

end
