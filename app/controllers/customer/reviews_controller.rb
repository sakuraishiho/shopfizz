class Customer::ReviewsController < ApplicationController
  before_action :authenticate_customer!, only: [:create]
  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
  end

  def create
    @product = Product.find_by(id: params[:product_id]) # find_byを使用して安全に取得
    if @product.nil?
      respond_to do |format|
        format.html { redirect_to root_path, alert: '商品が見つかりません。' }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('review_form', partial: 'shared/not_found',
                                                                   locals: { message: '商品が見つかりません。' })
        end
      end
      return
    end

    @review = @product.reviews.build(review_params)
    @review.customer_id = current_customer.id

    if @review.save
      respond_to do |format|
        format.html { redirect_to product_reviews_path(@product), notice: 'レビューの保存に成功しました。' }
        format.turbo_stream { redirect_to product_reviews_path(@product) }
      end
    else
      respond_to do |format|
        format.html { render 'customer/products/show', alert: 'レビューの保存に失敗しました。' }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('review_form', partial: 'customer/reviews/form',
                                                                   locals: { review: @review, product: @product })
        end
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :score, :content)
  end
end
