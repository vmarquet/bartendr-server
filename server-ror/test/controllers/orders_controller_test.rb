require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @order = orders(:one)
  end

  test "should get index" do
    sign_in User.find(1)
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    sign_in User.find(1)
    get :new
    assert_response :success
  end

  test "should create order" do
    sign_in User.find(1)
    assert_difference('Order.count') do
      post :create, order: { table: 15, items_attributes: [{ article_id: 1, comments: "au shaker" }] }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    sign_in User.find(1)
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    sign_in User.find(1)
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    sign_in User.find(1)
    patch :update, id: @order, order: { is_paid: @order.is_paid, is_preparation_done: @order.is_preparation_done, is_preparation_started: @order.is_preparation_started, is_served: @order.is_served }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    sign_in User.find(1)
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
