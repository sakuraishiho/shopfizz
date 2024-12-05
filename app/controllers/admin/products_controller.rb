class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.page(params[:page]).per(10) # 1ページあたり10件を表示
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product), notice: '商品が正常に作成されました。'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: '商品が正常に更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to admin_products_path, notice: '商品が正常に削除されました。' }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :image)
  end
end
