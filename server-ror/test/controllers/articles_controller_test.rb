require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @article = articles(:blonde_beer)
  end

  # TODO: tester que le JSON est en accès libre
  test "should get index" do
    sign_in User.find(1)
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    sign_in User.find(1)
    get :new
    assert_response :success
  end

  test "should create article" do
    sign_in User.find(1)
    assert_difference('Article.count') do
      post :create, article: { availability: true, category_id: 1, description: "Une bière brune.", name: "Bière brune", picture_url: "...", price: 10.00 }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    sign_in User.find(1)
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    sign_in User.find(1)
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    sign_in User.find(1)
    patch :update, id: @article, article: { availability: @article.availability, category: @article.category, description: @article.description, name: @article.name, picture_url: @article.picture_url, price: @article.price }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    sign_in User.find(1)
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end
end
