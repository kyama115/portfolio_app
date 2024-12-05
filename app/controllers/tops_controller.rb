class TopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index autocomplete]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).order(created_at: :desc).limit(12)
  end

  def autocomplete
    @shops = Shop.where("name ILIKE ?", "%#{params[:q]}%")
    render json: @shops.pluck(:name).map { |name| { name: name } }
  end
end
