# app/concepts/product/operation/index.rb
module Product::Operation
  class Index < Trailblazer::Operation
    step :fetch

    def fetch(ctx, **)
      ctx[:model] = ::Product.all
    end
  end
end
