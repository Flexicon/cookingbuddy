# frozen_string_literal: true

require "application_system_test_case"

class RecipesTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
  end

  test "should create a recipe" do
    visit recipes_path

    click_on "Add"

    fill_in "Name", with: "Ancient Potato Soup"
    select "Lunch", from: "Category"

    click_on "Add Recipe"

    assert_text "Added recipe for Ancient Potato Soup"
    assert_selector "h2", text: "Ancient Potato Soup"
  end

  test "should validate empty recipe form" do
    visit recipes_path

    click_on "Add"
    click_on "Add Recipe"

    assert_text "Oops, couldn't save this Recipe"
    assert_text "Name can't be blank"
    assert_text "Category can't be blank"
  end

  test "should validate recipe uniqueness" do
    visit recipes_path

    click_on "Add"

    fill_in "Name", with: recipes(:one).name
    select "Dinner", from: "Category"

    click_on "Add Recipe"

    assert_text "Oops, couldn't save this Recipe"
    assert_text "Name has already been taken"
  end
end
