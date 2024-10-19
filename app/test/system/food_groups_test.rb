require "application_system_test_case"

class FoodGroupsTest < ApplicationSystemTestCase
  setup do
    @food_group = food_groups(:one)
  end

  test "visiting the index" do
    visit food_groups_url
    assert_selector "h1", text: "Food groups"
  end

  test "should create food group" do
    visit food_groups_url
    click_on "New food group"

    fill_in "Name", with: @food_group.name
    click_on "Create Food group"

    assert_text "Food group was successfully created"
    click_on "Back"
  end

  test "should update Food group" do
    visit food_group_url(@food_group)
    click_on "Edit this food group", match: :first

    fill_in "Name", with: @food_group.name
    click_on "Update Food group"

    assert_text "Food group was successfully updated"
    click_on "Back"
  end

  test "should destroy Food group" do
    visit food_group_url(@food_group)
    click_on "Destroy this food group", match: :first

    assert_text "Food group was successfully destroyed"
  end
end
