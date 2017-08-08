require 'test_helper'

class TranslateMenuControllerTest < ActionDispatch::IntegrationTest
  test "should get show," do
    get translate_menu_show,_url
    assert_response :success
  end

  test "should get edit," do
    get translate_menu_edit,_url
    assert_response :success
  end

  test "should get index," do
    get translate_menu_index,_url
    assert_response :success
  end

  test "should get new" do
    get translate_menu_new_url
    assert_response :success
  end

end
