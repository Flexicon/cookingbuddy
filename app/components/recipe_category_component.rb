# frozen_string_literal: true

class RecipeCategoryComponent < ViewComponent::Base
  VARIANT = {
    breakfast: "badge-primary",
    lunch: "badge-accent",
    dinner: "badge-success",
    dessert: "badge-info",
    supper: "badge-warning"
  }

  def initialize(recipe: nil, category: nil, is_editable: true)
    if recipe.nil? && category.nil?
      raise ArgumentError, "Either recipe or category must be provided"
    end

    if recipe && category
      raise ArgumentError, "Only one of recipe or category should be provided"
    end

    @recipe = recipe
    @category = @recipe&.category || category
    @variant = VARIANT[@category.to_sym]
    @is_editable = is_editable && @recipe.present?

    @categories = if @recipe
      Recipe.categories.keys.map { |category| [category.humanize, category] }
    end
  end

  def editable?
    @is_editable
  end
end
