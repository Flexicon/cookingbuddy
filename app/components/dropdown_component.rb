# frozen_string_literal: true

class DropdownComponent < ViewComponent::Base
  renders_one :trigger
  renders_many :items

  DEFAULT_TRIGGER_CLASS = "btn btn-ghost"
  DEFAULT_MENU_CLASS = [
    "menu bg-base-100 dark:bg-base-200 border border-white/5 shadow-2xl outline outline-1 outline-black/5",
    "rounded-box z-1 min-w-52 max-w-64 p-2 shadow-lg"
  ]

  POSITIONS = %i[top bottom left right]

  def initialize(
    container_class: nil,
    trigger_class: DEFAULT_TRIGGER_CLASS,
    menu_class: DEFAULT_MENU_CLASS,
    item_class: nil,
    hover: false,
    align_end: false,
    position: :bottom
  )
    if POSITIONS.exclude?(position.to_sym)
      raise ArgumentError, "Invalid position: #{position}. Valid positions are: #{POSITIONS.join(", ")}"
    end

    @container_class = [
      container_class,
      "dropdown",
      ("dropdown-" + position.to_s),
      ("dropdown-hover" if hover),
      ("dropdown-end" if align_end)
    ].flatten.compact.uniq

    @trigger_class = trigger_class
    @menu_class = [menu_class, "dropdown-content"].flatten.compact.uniq
    @item_class = [item_class, "w-full"].flatten.compact.uniq
  end
end
