# frozen_string_literal: true

class RecipeFilterForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :category, :string
  attribute :protein_id, :integer
  attribute :carbohydrate_id, :integer
  attribute :search, :string

  def results
    scope = Recipe.all
    scope = scope.where(category:) if category.present?
    scope = scope.where("name LIKE ?", "%#{search}%") if search.present?
    scope
  end

  def filled?
    category.present? || protein_id.present? || carbohydrate_id.present? || search.present?
  end
end
