# frozen_string_literal: true

require "test_helper"

class DropdownComponentTest < ViewComponent::TestCase
  def test_component_renders
    render_inline(DropdownComponent.new) do |c|
      c.with_trigger { "Dropdown Trigger" }
      c.with_item { "Item 1" }
      c.with_item { "Item 2" }
      c.with_item { "Item 3" }
    end

    assert_selector ".dropdown"
    assert_selector "div[role=button]", text: "Dropdown Trigger"
    assert_selector ".dropdown-content li", text: "Item 1"
    assert_selector ".dropdown-content li", text: "Item 2"
    assert_selector ".dropdown-content li", text: "Item 3"
  end

  def test_component_with_custom_classes
    render_inline(DropdownComponent.new(
      container_class: "custom-container",
      trigger_class: "custom-trigger",
      menu_class: "custom-menu"
    )) do |c|
      c.with_trigger { "Custom Trigger" }
      c.with_item(class: "custom-item") { "Custom Item 1" }
      c.with_item(class: "custom-item") { "Custom Item 2" }
    end

    assert_selector ".custom-container.dropdown"
    assert_selector ".custom-trigger", text: "Custom Trigger"
    assert_selector ".custom-menu .custom-item", text: "Custom Item 1"
    assert_selector ".custom-menu .custom-item", text: "Custom Item 2"
  end
end
