module Cart::Operation
  class GetLineItems < Trailblazer::Operation
    step :get_line_items
    step :calculate_total
    step :count_cart

    def get_line_items(ctx, session:, **)
      ctx[:line_items] = {}.tap do |line_items|
        session[:cart]&.each do |product_id, quantity|
          line_items[Product.find(product_id)] = quantity
        end
      end
    end

    def calculate_total(ctx, **)
      total = ctx[:line_items].map { |k, v| k.price * v }.sum
      ctx[:line_items].each do |p, q|
        if p.code == 'GR1' && q % 2 == 0
          total -= (q / 2) * p.price  
        end
        if p.code == 'SR1' && q >= 3
          total -= (q * (p.price - 4.50)) 
        end
        if p.code == "CF1" && q >= 3
          total -= (q * (2/3) * p.price) 
        end
      end

      ctx[:total] = total
    end

    def count_cart(ctx, **)
      ctx[:count_cart] = ctx[:session][:cart].nil? ? 0 : ctx[:session][:cart].map { |_k, v| v }.sum
    end
  end
end
