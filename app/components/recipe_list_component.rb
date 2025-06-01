# frozen_string_literal: true

class RecipeListComponent < ViewComponent::Base
  def initialize(recipes:, blank_message: "No recipes found", show_categories: true)
    @recipes = recipes
    @blank_message = blank_message
    @show_categories = show_categories
  end
end
