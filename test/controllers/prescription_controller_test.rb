require 'test_helper'

class PrescriptionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prescription_index_url
    assert_response :success
  end

  test "should get new" do
    get prescription_new_url
    assert_response :success
  end

  test "should get create" do
    get prescription_create_url
    assert_response :success
  end

  test "should get show" do
    get prescription_show_url
    assert_response :success
  end

  test "should get edit" do
    get prescription_edit_url
    assert_response :success
  end

  test "should get update" do
    get prescription_update_url
    assert_response :success
  end

  test "should get delete" do
    get prescription_delete_url
    assert_response :success
  end

end
