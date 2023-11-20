require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test 'should get cart' do
    get cart_url
    assert_response :success
  end

  test 'should post add line_item' do
    post cart_add_line_item_url, params: { product_id: products(:one).id }
    assert_response :redirect
  end


end
