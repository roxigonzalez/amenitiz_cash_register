require 'test_helper'

class GetLineItemsOperationTest < ActiveSupport::TestCase
  setup do
    @product_gr1 = Product.create(name: 'Green Tea', price: 3.11, code: 'GR1')
    @product_sr1 = Product.create(name: 'Strawberries', price: 5.0, code: 'SR1')
    @product_cf1 = Product.create(name: 'Coffee', price: 11.23, code: 'CF1')
  end

  test 'get_line_items gets line items from session' do
    session = { cart: { @product_gr1.id => 2, @product_sr1.id => 3 } }
    result = Cart::Operation::GetLineItems.call(session: session)
    line_items = result[:line_items]

    assert_equal 2, line_items.size
    assert_equal 2, line_items[@product_gr1]
    assert_equal 3, line_items[@product_sr1]
  end

  test 'calculate_total applies discounts correctly' do
    session = { cart: { @product_gr1.id => 2 } }
    result = Cart::Operation::GetLineItems.call(session: session)
    total = result[:total]
    assert_equal 3.11, total
    # SR1,SR1,GR1,SR1	16.61€
    # GR1,CF1,SR1,CF1,CF1 30.57€
    session = { cart: { @product_gr1.id => 1, @product_sr1.id => 3 } }
    result = Cart::Operation::GetLineItems.call(session: session)
    total = result[:total]
    assert_equal 16.61, total
  end
end
