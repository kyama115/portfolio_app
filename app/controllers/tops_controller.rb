class TopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).order(created_at: :desc).limit(9)
  end

  # def autocomplete
  #   @shops = Shop.where('title LIKE ?', "%#{params[:title]}%")
  #   respond_to do |format|
  #     format.json { render json: @shops.map(&:title) }
  #   end
  # end
end
