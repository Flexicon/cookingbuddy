# frozen_string_literal: true

class RecipeListComponent < ViewComponent::Base
  def initialize(recipes:)
    @recipes = recipes
  end
end
