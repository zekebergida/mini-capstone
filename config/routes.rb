Rails.application.routes.draw do
  get '/all-products' => 'products#all_products'
  get 'add-product' => 'products#add_product'
  post 'save-product' => 'products#save_product'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
