require 'test_helper'

class Ota::CodeList::ListsControllerTest < ActionController::TestCase
  setup do
    @ota_code_list_list = ota_code_list_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ota_code_list_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ota_code_list_list" do
    assert_difference('Ota::CodeList::List.count') do
      post :create, :ota_code_list_list => @ota_code_list_list.attributes
    end

    assert_redirected_to ota_code_list_list_path(assigns(:ota_code_list_list))
  end

  test "should show ota_code_list_list" do
    get :show, :id => @ota_code_list_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ota_code_list_list.to_param
    assert_response :success
  end

  test "should update ota_code_list_list" do
    put :update, :id => @ota_code_list_list.to_param, :ota_code_list_list => @ota_code_list_list.attributes
    assert_redirected_to ota_code_list_list_path(assigns(:ota_code_list_list))
  end

  test "should destroy ota_code_list_list" do
    assert_difference('Ota::CodeList::List.count', -1) do
      delete :destroy, :id => @ota_code_list_list.to_param
    end

    assert_redirected_to ota_code_list_lists_path
  end
end
