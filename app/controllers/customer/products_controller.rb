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
end
