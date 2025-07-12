# frozen_string_literal: true

class RecipeFilterForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :category, :string
  attribute :protein_id, :integer
  attribute :carbohydrate_id, :integer
  attribute :search, :string

  def results
    Recipe.all
      .then(&method(:filter_by_category))
      .then(&method(:filter_by_product_ids))
      .then(&method(:filter_by_search))
  end

  def filled?
    attributes.values.any?(&:present?)
  end

  def filters_count
    attributes.values.count(&:present?)
  end

  private

  def filter_by_category(scope)
    category.present? ? scope.where(category: category) : scope
  end

  def filter_by_product_ids(scope)
    return scope if protein_id.blank? && carbohydrate_id.blank?

    product_ids = [protein_id, carbohydrate_id].compact

    scope
      .joins(:ingredients)
      .where(ingredients: {product_id: product_ids})
      .group("recipes.id")
      .having("COUNT(DISTINCT ingredients.product_id) = ?", product_ids.size)
  end

  def filter_by_search(scope)
    search.present? ? scope.where("name LIKE ?", "%#{search}%") : scope
  end
end
