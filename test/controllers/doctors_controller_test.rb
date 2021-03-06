require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctors_index_url
    assert_response :success
  end

  test "should get edit" do
    get doctors_edit_url
    assert_response :success
  end

  test "should get show" do
    get doctors_show_url
    assert_response :success
  end

  test "should get _form" do
    get doctors__form_url
    assert_response :success
  end

end
