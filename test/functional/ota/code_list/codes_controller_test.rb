require 'test_helper'

class Ota::CodeList::CodesControllerTest < ActionController::TestCase
  setup do
    @ota_code_list_code = ota_code_list_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ota_code_list_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ota_code_list_code" do
    assert_difference('Ota::CodeList::Code.count') do
      post :create, :ota_code_list_code => @ota_code_list_code.attributes
    end

    assert_redirected_to ota_code_list_code_path(assigns(:ota_code_list_code))
  end

  test "should show ota_code_list_code" do
    get :show, :id => @ota_code_list_code.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ota_code_list_code.to_param
    assert_response :success
  end

  test "should update ota_code_list_code" do
    put :update, :id => @ota_code_list_code.to_param, :ota_code_list_code => @ota_code_list_code.attributes
    assert_redirected_to ota_code_list_code_path(assigns(:ota_code_list_code))
  end

  test "should destroy ota_code_list_code" do
    assert_difference('Ota::CodeList::Code.count', -1) do
      delete :destroy, :id => @ota_code_list_code.to_param
    end

    assert_redirected_to ota_code_list_codes_path
  end
end
