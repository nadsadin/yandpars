require 'test_helper'

class ParceFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parce_files_index_url
    assert_response :success
  end

  test "should get show" do
    get parce_files_show_url
    assert_response :success
  end

  test "should get new" do
    get parce_files_new_url
    assert_response :success
  end

  test "should get create" do
    get parce_files_create_url
    assert_response :success
  end

end
