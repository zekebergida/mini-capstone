class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products
  belongs_to :supplier
  has_many :images
  has_many :orders
  def sale_message
    if price < 2
      "Discount Item!"
    else 
      "Everyday Value!"
    end 
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
