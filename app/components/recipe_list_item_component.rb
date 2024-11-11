# frozen_string_literal: true

class RecipeListItemComponent < ViewComponent::Base
  def initialize(recipe:)
    @recipe = recipe
  end
end
