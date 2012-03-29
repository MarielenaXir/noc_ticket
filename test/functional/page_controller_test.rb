require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

end
