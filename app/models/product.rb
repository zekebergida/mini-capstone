class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { maximum: 500 }
  validates :price, presence: true
  validates :price, numericality: true
  has_many :carted_products
  has_many :category_products
  has_many :categories, through: :category_products
  belongs_to :supplier
  has_many :images
  has_many :orders, through: :carted_products
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
