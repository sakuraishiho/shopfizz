class Product < ApplicationRecord
  paginates_per 10
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :stock
    validates :image
  end
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f
    end
  end

  def review_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f * 100 / 5
    end
  end
end
