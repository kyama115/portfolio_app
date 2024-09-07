class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop

  def new
    @review = current_user.reviews.new
  end

  def edit
    @review = current_user.reviews.find(params[:id])
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to shop_path(@review.shop), notice: 'レビューを投稿しました。'
    else
      render :new
    end
  end

  def update
    @review = current_user.reviews.find(params[:id])
    @review.update(review_params)
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy!
    redirect_to shop_path(@review.shop), notice: 'レビューを削除しました。'
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating, :status).merge(shop_id: params[:shop_id])
  end
end
