class CartController < ApplicationController
  def add_line_item
    result = Cart::Operation::AddToCart.call(params: params, session: session)
    @message = result.success? ? result[:success_message] : 'Something went wrong'
    redirect_to cart_path
  end

  def index
    result = Cart::Operation::GetLineItems.call(session: session)
    @line_items = result[:line_items]
    @total = result[:total]
    @count_cart = result[:count_cart]
  end
end
