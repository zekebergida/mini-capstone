class ProductsController < ApplicationController

  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
  end

  def create
    new_product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
      )
    new_product.save
    @products = Product.all
    render 'index.html.erb'
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
      )

    @products = Product.all
    render 'index.html.erb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    @products = Product.all
    render 'index.html.erb'
  end

end
