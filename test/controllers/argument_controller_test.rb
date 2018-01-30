require 'test_helper'

class ArgumentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get argument_index_url
    assert_response :success
  end

end
