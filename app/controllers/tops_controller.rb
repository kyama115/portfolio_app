class TopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index autocomplete]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).order(created_at: :desc).limit(12)
  end

  def autocomplete
    @shops = Shop.where('title LIKE ?', "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end
end
