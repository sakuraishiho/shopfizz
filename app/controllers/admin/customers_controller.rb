class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_customer, only: %i[show update]

  def index
    @customers = Customer.preload(:orders).latest
    @customers = Customer.page(params[:page]).per(10) # 1ページあたり10件を表示
  end

  def show; end

  def update
    @customer.update(customer_params)
    redirect_to admin_customers_path, notice: '会員ステータスが正常に更新されました。'
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:status)
  end
end
