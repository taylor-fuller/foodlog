require "application_system_test_case"

class MealTypesTest < ApplicationSystemTestCase
  setup do
    @meal_type = meal_types(:one)
  end

  test "visiting the index" do
    visit meal_types_url
    assert_selector "h1", text: "Meal Types"
  end

  test "creating a Meal type" do
    visit meal_types_url
    click_on "New Meal Type"

    fill_in "Title", with: @meal_type.title
    click_on "Create Meal type"

    assert_text "Meal type was successfully created"
    click_on "Back"
  end

  test "updating a Meal type" do
    visit meal_types_url
    click_on "Edit", match: :first

    fill_in "Title", with: @meal_type.title
    click_on "Update Meal type"

    assert_text "Meal type was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal type" do
    visit meal_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal type was successfully destroyed"
  end
end
