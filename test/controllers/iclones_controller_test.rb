require 'test_helper'

class IclonesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get iclones_index_url
    assert_response :success
  end

  test "should get new" do
    get iclones_new_url
    assert_response :success
  end

end
