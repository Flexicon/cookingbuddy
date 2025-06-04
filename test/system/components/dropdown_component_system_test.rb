# frozen_string_literal: true

require "application_system_test_case"

class DropdownComponentSystemTest < ApplicationSystemTestCase
  def test_default_preview
    visit("/rails/view_components/dropdown_component/default")

    assert_no_text("Item 1")
    assert_no_text("Item 2")
    assert_no_text("Item 3")

    find("[role=button]", text: "Dropdown Trigger").click

    assert_text("Item 1")
    assert_text("Item 2")
    assert_text("Item 3")
  end
end
