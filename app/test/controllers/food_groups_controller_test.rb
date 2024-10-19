require "test_helper"

class FoodGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_group = food_groups(:one)
  end

  test "should get index" do
    get food_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_food_group_url
    assert_response :success
  end

  test "should create food_group" do
    assert_difference("FoodGroup.count") do
      post food_groups_url, params: { food_group: { name: @food_group.name } }
    end

    assert_redirected_to food_group_url(FoodGroup.last)
  end

  test "should show food_group" do
    get food_group_url(@food_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_group_url(@food_group)
    assert_response :success
  end

  test "should update food_group" do
    patch food_group_url(@food_group), params: { food_group: { name: @food_group.name } }
    assert_redirected_to food_group_url(@food_group)
  end

  test "should destroy food_group" do
    assert_difference("FoodGroup.count", -1) do
      delete food_group_url(@food_group)
    end

    assert_redirected_to food_groups_url
  end
end
