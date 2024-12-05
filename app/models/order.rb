class Order < ApplicationRecord
  belongs_to :customer
  enum status: {
    入金待ち: 0,
    入金確認: 1,
    出荷済み: 2,
    配送中: 3,
    配達済み: 4
  }
  has_many :order_details, dependent: :destroy

  scope :waiting_payment, -> { where(status: '入金待ち') }
  scope :confirm_payment, -> { where(status: '入金確認') }
  scope :shipped, -> { where(status: '出荷済み') }
  scope :out_of_delivery, -> { where(status: '配送中') }
  scope :delivered, -> { where(status: '配達済み') }

  scope :created_today, -> { where('orders.created_at >= ?', Time.zone.now.beginning_of_day) }
end
