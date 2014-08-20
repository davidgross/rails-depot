class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @visit_count = store_visits
    end
  end

  def store_visits
    session[:counter] ||= 0
    session[:counter] += 1
  end
end
