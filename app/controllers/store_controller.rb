class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    @visit_count = store_visits
  end

  def store_visits
    session[:counter] ||= 0
    session[:counter] += 1
  end
end
