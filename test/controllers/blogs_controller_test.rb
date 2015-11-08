require 'test_helper'

class BlogsControllerTest < ActionController::TestCase
  setup do
    @blog = blogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create blog" do
    assert_difference('Blog.count') do
      post :create, params: { blog: { content: @blog.content, referencce: @blog.referencce, title: @blog.title } }
    end

    assert_response 201
  end

  test "should show blog" do
    get :show, params: { id: @blog }
    assert_response :success
  end

  test "should update blog" do
    patch :update, params: { id: @blog, blog: { content: @blog.content, referencce: @blog.referencce, title: @blog.title } }
    assert_response 200
  end

  test "should destroy blog" do
    assert_difference('Blog.count', -1) do
      delete :destroy, params: { id: @blog }
    end

    assert_response 204
  end
end
