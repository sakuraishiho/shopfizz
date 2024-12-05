class Admin::PagesController < ApplicationController
  before_action :authenticate_admin!

  def home
    @orders, @selected = get_orders(params)
    @orders = @orders.page(params[:page]).per(10) # 検索結果にページネーションを適用
    today_orders = Order.created_today
    @today_total_orders = total_orders(today_orders)
    @today_total_sales = total_sales(today_orders)
  end

  private

  def get_orders(params)
    if !params[:status].present? || !Order.statuses.keys.to_a.include?(params[:status])
      return [Order.eager_load(:customer).latest,
              'all']
    end

    get_by_enum_value(params[:status])
  end

  def get_by_enum_value(status)
    case status
    when '入金待ち'
      [Order.waiting_payment.eager_load(:customer).latest, '入金待ち']
    when '入金確認'
      [Order.confirm_payment.eager_load(:customer).latest, '入金確認']
    when '出荷済み'
      [Order.shipped.eager_load(:customer).latest, '出荷済み']
    when '配送中'
      [Order.out_of_delivery.eager_load(:customer).latest, '配送中']
    when '配達済み'
      [Order.delivered.eager_load(:customer).latest, '配達済み']
    end
  end

  def total_orders(orders)
    orders.count
  end

  def total_sales(orders)
    orders.sum(:billing_amount)
  end
end
