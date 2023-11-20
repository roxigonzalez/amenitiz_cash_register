class ProductsController < ApplicationController
  def index
    @count_cart = session[:cart].nil? ? 0 : session[:cart].map { |_k, v| v }.sum
    run Product::Operation::Index do |ctx|
      @products = ctx[:model]
      @total = @model.count

      render
    end
  end
end
