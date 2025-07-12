# frozen_string_literal: true

class RecipeFiltersComponent < ViewComponent::Base
  def initialize(filter:, categories: nil, proteins: nil, carbohydrates: nil)
    @filter = filter
    @categories = categories || Recipe.categories.keys.map { |c| [c.humanize, c] }
    @proteins = proteins || Product.protein.all
    @carbohydrates = carbohydrates || Product.carbohydrate.all
  end
end
