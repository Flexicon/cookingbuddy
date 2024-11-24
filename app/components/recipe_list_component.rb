# frozen_string_literal: true

class RecipeListComponent < ViewComponent::Base
  def initialize(recipes:, blank_message: "No recipes found")
    @recipes = recipes
    @blank_message = blank_message
  end
end
