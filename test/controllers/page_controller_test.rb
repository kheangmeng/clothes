require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get page_about_url
    assert_response :success
  end

  test "should get contact" do
    get page_contact_url
    assert_response :success
  end

end
