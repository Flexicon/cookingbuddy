# frozen_string_literal: true

class DropdownComponentPreview < ViewComponent::Preview
  def default
    render(DropdownComponent.new) do |c|
      c.with_trigger { "Dropdown Trigger" }

      c.with_item { tag.a "Item 1", href: "#" }
      c.with_item { tag.a "Item 2", href: "#" }
      c.with_item { tag.a "Item 3", href: "#" }
    end
  end

  def hover
    render(DropdownComponent.new(hover: true)) do |c|
      c.with_trigger { "Dropdown Trigger - Hover" }

      c.with_item { tag.a "Item 1", href: "#" }
      c.with_item { tag.a "Item 2", href: "#" }
      c.with_item { tag.a "Item 3", href: "#" }
    end
  end
end
