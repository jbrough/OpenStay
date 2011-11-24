require 'test_helper'

class Geo::CountriesControllerTest < ActionController::TestCase
  setup do
    @geo_country = geo_countries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:geo_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create geo_country" do
    assert_difference('Geo::Country.count') do
      post :create, :geo_country => @geo_country.attributes
    end

    assert_redirected_to geo_country_path(assigns(:geo_country))
  end

  test "should show geo_country" do
    get :show, :id => @geo_country.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @geo_country.to_param
    assert_response :success
  end

  test "should update geo_country" do
    put :update, :id => @geo_country.to_param, :geo_country => @geo_country.attributes
    assert_redirected_to geo_country_path(assigns(:geo_country))
  end

  test "should destroy geo_country" do
    assert_difference('Geo::Country.count', -1) do
      delete :destroy, :id => @geo_country.to_param
    end

    assert_redirected_to geo_countries_path
  end
end
