require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @category = categories(:beer)
  end

  test "should get index" do
    sign_in User.find(1)
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    sign_in User.find(1)
    get :new
    assert_response :success
  end

  test "should create category" do
    sign_in User.find(1)
    assert_difference('Category.count') do
      post :create, category: { name: "Vin" }
    end

    assert_redirected_to articles_path
  end

  test "should show category" do
    sign_in User.find(1)
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    sign_in User.find(1)
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    sign_in User.find(1)
    patch :update, id: @category, category: { name: @category.name }
    assert_redirected_to articles_path
  end

  test "should destroy category" do
    sign_in User.find(1)
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end
