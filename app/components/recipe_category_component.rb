# frozen_string_literal: true

class RecipeCategoryComponent < ViewComponent::Base
  VARIANT = {
    breakfast: "badge-primary",
    lunch: "badge-accent",
    dinner: "badge-success",
    dessert: "badge-info",
    supper: "badge-warning"
  }.freeze

  def initialize(recipe: nil, category: nil, is_editable: true)
    raise ArgumentError, "Either recipe or category must be provided" if recipe.nil? && category.nil?

    raise ArgumentError, "Only one of recipe or category should be provided" if recipe && category

    @recipe = recipe
    @category = @recipe&.category || category
    @variant = VARIANT[@category.to_sym]
    @is_editable = is_editable && @recipe.present?

    @categories = (Recipe.categories.keys.map { |category| [category.humanize, category] } if @recipe)
  end

  def editable?
    @is_editable
  end
end
