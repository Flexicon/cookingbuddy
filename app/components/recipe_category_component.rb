# frozen_string_literal: true

class RecipeCategoryComponent < ViewComponent::Base
  VARIANT = {
    breakfast: "badge-primary",
    lunch: "badge-accent",
    dinner: "badge-success text-gray-100",
    dessert: "badge-info text-gray-50",
    supper: "badge-warning"
  }

  def initialize(category:)
    @category = category
    @variant = VARIANT[category.to_sym]
  end
end
