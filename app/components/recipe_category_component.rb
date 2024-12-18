# frozen_string_literal: true

class RecipeCategoryComponent < ViewComponent::Base
  VARIANT = {
    breakfast: "badge-primary",
    lunch: "badge-accent",
    dinner: "badge-success",
    dessert: "badge-info",
    supper: "badge-warning"
  }

  def initialize(category:)
    @category = category
    @variant = VARIANT[category.to_sym]
  end
end
