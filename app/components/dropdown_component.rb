# frozen_string_literal: true

class DropdownComponent < ViewComponent::Base
  renders_one :trigger
  renders_many :items

  DEFAULT_TRIGGER_CLASS = "btn btn-ghost"
  DEFAULT_MENU_CLASS = "dropdown-content menu bg-base-100 rounded-box z-[1] w-52 p-2 shadow"

  def initialize(trigger_class: DEFAULT_TRIGGER_CLASS, menu_class: DEFAULT_MENU_CLASS, item_class: nil)
    @trigger_class = trigger_class
    @menu_class = menu_class
    @item_class = item_class
  end
end
