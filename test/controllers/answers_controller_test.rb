require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post :create, params: { answer: { content: @answer.content, question_id: @answer.question_id, user_id: @answer.user_id } }
    end

    assert_response 201
  end

  test "should show answer" do
    get :show, params: { id: @answer }
    assert_response :success
  end

  test "should update answer" do
    patch :update, params: { id: @answer, answer: { content: @answer.content, question_id: @answer.question_id, user_id: @answer.user_id } }
    assert_response 200
  end

  test "should destroy answer" do
    assert_difference('Answer.count', -1) do
      delete :destroy, params: { id: @answer }
    end

    assert_response 204
  end
end
