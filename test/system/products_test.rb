# frozen_string_literal: true

require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
  end

  test "should create a product" do
    visit products_path

    click_on "Add"

    fill_in "Name", with: "Ancient Potato"
    select "Carbohydrate", from: "Category"

    click_on "Add Product"

    assert_selector "h2", text: "Product:\nAncient Potato"
  end

  test "should validate empty product form" do
    visit products_path

    click_on "Add"
    click_on "Add Product"

    assert_text "Oops, couldn't save this product"
    assert_text "Name can't be blank"
    assert_text "Category can't be blank"
  end

  test "should validate product uniqueness" do
    visit products_path

    click_on "Add"

    fill_in "Name", with: products(:one).name
    select "Carbohydrate", from: "General"

    click_on "Add Product"

    assert_text "Oops, couldn't save this product"
    assert_text "Name has already been taken"
  end
end
