require "test_helper"

class Public::MemberTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_member_tasks_new_url
    assert_response :success
  end

  test "should get index" do
    get public_member_tasks_index_url
    assert_response :success
  end
end
