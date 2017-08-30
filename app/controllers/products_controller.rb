class ProductsController < ApplicationController
  before_action :authenticate_admin!, except:[:index, :show]
  def index
    # if params[:name]
    #   @products = Product.where("name LIKE ?", "%#{params[:name]}%")
    # elsif params[:price_category] == "discount"
    #   @products = Product.where("price <= ?", 3)
    # elsif params[:sort_by] && params[:order]
    #   @products = Product.order(params[:sort_by] => params[:order])
    # else
    #   @products = Product.order(:name)
    # end
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
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
    @product = Product.new
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      #image: params[:images]
      supplier_id: params[:supplier_id]
      )
    if @product.save
      flash[:success] = "You just added the product: #{@product.name}."
      redirect_to "/products/#{@product.id}"
    else
      render "new.html.erb"
    end  
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      #image: params[:images]
      supplier_id: params[:supplier_id]
    )

    if @product.save
      flash[:success] = "You just updated the product: #{@product.name}."
      redirect_to "/products/#{@product.id}"
    else
      render "edit.html.erb"
    end

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
