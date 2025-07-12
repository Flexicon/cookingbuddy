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
    [category, protein_id, carbohydrate_id, search].any?(&:present?)
  end

  private

  def filter_by_category(scope)
    category.present? ? scope.where(category: category) : scope
  end

  def filter_by_product_ids(scope)
    return scope if protein_id.blank? && carbohydrate_id.blank?

    scope = scope.joins(:ingredients)
    scope = scope.where(ingredients: {product_id: protein_id}) if protein_id.present?
    scope = scope.where(ingredients: {product_id: carbohydrate_id}) if carbohydrate_id.present?
    scope.distinct
  end

  def filter_by_search(scope)
    search.present? ? scope.where("name LIKE ?", "%#{search}%") : scope
  end
end
