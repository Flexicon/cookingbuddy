# frozen_string_literal: true

class DropdownComponent < ViewComponent::Base
  renders_one :trigger
  renders_many :items

  DEFAULT_TRIGGER_CLASS = "btn btn-ghost"
  DEFAULT_MENU_CLASS = "menu bg-base-100 rounded-box z-[1] w-52 p-2 shadow"

  POSITIONS = %w[top bottom left right]

  def initialize(
    container_class: nil,
    trigger_class: DEFAULT_TRIGGER_CLASS,
    menu_class: DEFAULT_MENU_CLASS,
    item_class: nil,
    hover: false,
    align_end: false,
    position: "bottom"
  )
    if POSITIONS.exclude?(position)
      raise ArgumentError, "Invalid position: #{position}. Valid positions are: #{POSITIONS.join(", ")}"
    end

    @container_class = [
      container_class,
      "dropdown",
      ("dropdown-" + position),
      ("dropdown-hover" if hover),
      ("dropdown-end" if align_end)
    ].flatten.compact.uniq

    @trigger_class = trigger_class
    @menu_class = [menu_class, "dropdown-content"].flatten.compact.uniq
    @item_class = item_class
  end
end
