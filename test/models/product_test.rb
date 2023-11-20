require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should not save product without a name' do
    product = Product.new
    assert_not product.save, 'Saved the product without a name'
  end

  test 'should not save product without a price' do
    product = Product.new(name: 'Example Product', code: 'ABC123')
    assert_not product.save, 'Saved the product without a price'
  end

  test 'should not save product without a code' do
    product = Product.new(name: 'Example Product', price: 19.99)
    assert_not product.save, 'Saved the product without a code'
  end

  test 'should not save product with a non-positive price' do
    product = Product.new(name: 'Example Product', price: 0, code: 'ABC123')
    assert_not product.save, 'Saved the product with a non-positive price'
  end

  test 'should not save product with a name longer than 100 characters' do
    product = Product.new(name: 'A' * 101, price: 19.99, code: 'ABC123')
    assert_not product.save, 'Saved the product with a name longer than 100 characters'
  end

  test 'should save valid product' do
    product = Product.new(name: 'Example Product', price: 19.99, code: 'ABC123')
    assert product.save, 'Could not save valid product'
  end
end
