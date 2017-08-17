class ProductsController < ApplicationController

  def index
    if params[:name]
      @products = Product.where("name LIKE ?", "%#{params[:name]}%")
    elsif params[:price_category] == "discount"
      @products = Product.where("price <= ?", 3)
    elsif params[:sort_by] && params[:order]
      @products = Product.order(params[:sort_by] => params[:order])
    else
      @products = Product.order(:name)
    end
    render 'index.html.erb'
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    render 'show.html.erb'
  end

  def new
  end

  def create
    product1 = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
      )
    product1.save
    #@products = Product.all
    #render 'index.html.erb'
    flash[:success] = "You just added the product: #{product1.name}."
    redirect_to "/products/#{product1.id}"
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

    #@products = Product.all
    #render 'index.html.erb'
    flash[:success] = "You just updated the product: #{@product.name}."
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    #@products = Product.all
    #render 'index.html.erb'
    flash[:danger] = "You just deleted the product: #{@product.name}"
    redirect_to "/products"
  end

end
