class ImagesController < ApplicationController

  def new
    render "new.html.erb"
  end

  def create
    image1 = Image.new(
      name: params[:name], 
      location: params[:location], 
      product_id: params[product_id]
    )
    image1.save
  end
end
