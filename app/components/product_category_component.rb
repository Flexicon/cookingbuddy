# frozen_string_literal: true

class ProductCategoryComponent < ViewComponent::Base
  VARIANT = {
    general: "badge-info",
    protein: "badge-secondary",
    carbohydrate: "badge-accent"
  }

  def initialize(category:)
    @category = category
    @variant = VARIANT[category.to_sym]
  end
end
