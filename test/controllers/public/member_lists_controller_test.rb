require "test_helper"

class Public::MemberListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_member_lists_new_url
    assert_response :success
  end

  test "should get index" do
    get public_member_lists_index_url
    assert_response :success
  end
end
