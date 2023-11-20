require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  setup do
    # session[:cart] = {}
  end

  test 'should get index' do
    get products_url
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test 'should set @count_cart to 0 if session[:cart] is nil' do
    # session[:cart] = nil
    get products_url
    assert_equal 0, assigns(:count_cart)
  end
end
