class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def confirm_withdraw; end

  def withdraw
    current_customer.update(status: '退会済')
    reset_session
    redirect_to root_path, notice: 'shopfizzから正常に退会しました'
  end
end
