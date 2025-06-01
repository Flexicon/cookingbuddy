# frozen_string_literal: true

class RecipeListItemComponent < ViewComponent::Base
  def initialize(recipe:, show_category: true)
    @recipe = recipe
    @show_category = show_category
  end
end
