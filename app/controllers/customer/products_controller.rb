class Customer::ProductsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  def index
    @products = Product.page(params[:page]).per(9) # 1ページあたり9件を表示
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @review = Review.new
  end

  private

  def get_products(params)
    return Product.all, 'default' unless params[:latest] || params[:price_high_to_low] || params[:price_low_to_high]

    return Product.latest, 'latest' if params[:latest]

    return Product.price_high_to_low, 'price_high_to_low' if params[:price_high_to_low]

    [Product.price_low_to_high, 'price_low_to_high'] if params[:price_low_to_high]
  end
end
