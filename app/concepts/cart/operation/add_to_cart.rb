# app/concepts/cart/operation/add_to_cart.rb
module Cart::Operation
  class AddToCart < Trailblazer::Operation
    step :find_product
    step :add_to_cart
    step :set_success_message

    def find_product(ctx, params:, **)
      product_id = params[:product_id]
      ctx[:product] = Product.find(product_id)

      !ctx[:product].nil?
    end

    def add_to_cart(_ctx, product:, session:, **)
      session[:cart] ||= {}
      if session[:cart].key?(product.id.to_s)
        session[:cart][product.id.to_s] += 1
      else
        session[:cart][product.id.to_s] = 1
      end
      true
    end

    def set_success_message(ctx, product:, **)
      ctx[:success_message] = "Product #{product.name} added to cart"
      true
    end
  end
end
