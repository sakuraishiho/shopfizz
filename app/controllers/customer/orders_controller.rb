class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.latest.page(params[:page]).per(5) # 1ページあたり1件を表示
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def success; end
end
